const fs = require('fs');
const Trello = require("trello");
const readline = require('readline');

const APP_KEY = process.env.TRELLO_APP_KEY;
const TOKEN = process.env.TRELLO_TOKEN;
const DATA_DIR = "data/";
const BOARD_ID = "5a3092b1eb2175c5d50b7f42";
const WEEKDAY_COUNT = 5;
const WEEKEND_COUNT = 10;

var trello = new Trello(APP_KEY, TOKEN);

async function main() {
  var nameToIdMapping = await getListNameToIdMapping(BOARD_ID);
  console.log(nameToIdMapping);
  // var fileNames = await readdir(DATA_DIR);
  var fileNames = ["Google", "Facebook"];
  var startDay = new Date();
  startDay.setDate(startDay.getDate() + 1);
  console.log("startDay = ", startDay);
  var checklist = [];
  for (fileNameIndex = 0; fileNameIndex < fileNames.length; fileNameIndex++) {
    const fileName = fileNames[fileNameIndex];
    const listId = await getList(nameToIdMapping, fileName);
    const cardNameToIds = await getCardNameToId(listId);
    console.log("cardNameToIds = ", cardNameToIds);
    const rl = readline.createInterface({
      input: fs.createReadStream(DATA_DIR + fileName),
      crlfDelay: Infinity
    });

    for await (const lineRaw of rl) {
      var line = lineRaw.trim();
      if (line.length != 0) {
        var items = line.split("\t");
        var id = items[0],
          nameSuffix = items[1],
          name = id + " " + nameSuffix;
        checklist.push(name);
        if (checklist.length === await getThreshold(startDay)) {
          await addCheckItemsToList(cardNameToIds, checklist, startDay, listId);
          // step
          startDay.setDate(startDay.getDate() + 1);
          checklist = [];
        }
      }
    }
    if (checklist.length != 0) {
      await addCheckItemsToList(cardNameToIds, checklist, startDay, listId);
    }
  } // end of file name loop
}

async function getCardNameToId(listId) {
  var res = {};
  cards = await trello.getCardsOnList(listId);
  cards.forEach(e => res[e.name] = e.id);
  return res;
}

async function addCheckItemsToList(cardNameToId, checklist, day, listId) {
  var name = day.getFullYear() + "-" + day.getMonth() + "-" + day.getDate();
  var due = new Date(day.getFullYear(), day.getMonth(), day.getDate(), 23, 59, 59); // 2013-07-30 23:59:59
  console.log("toCreate", name, checklist);
  if (name in cardNameToId) {
    // delete card
    await trello.deleteCard(cardNameToId[name]);
  }
  var card = await trello.addCardWithExtraParams(name, {
    "due": due
  }, listId);
  cardNameToId[name] = card.id;
  console.log("created", card.id, due, checklist);
  // create check
  var trelloChecklist = await trello.addChecklistToCard(card.id, "Leetcode");
  for (var i = 0; i < checklist.length; i++) {
    await trello.addItemToChecklist(trelloChecklist.id, checklist[i]);
  }
}

async function getThreshold(date) {
  const day = date.getDay();
  if (day === 6 || day === 0) {
    return WEEKEND_COUNT;
  } else {
    return WEEKDAY_COUNT;
  }
}

async function getList(nameToIdMapping, name) {
  if (!(name in nameToIdMapping)) {
    var list = await trello.addListToBoard(BOARD_ID, name);
    nameToIdMapping[name] = list.id;
  }
  return nameToIdMapping[name];
}

async function getListNameToIdMapping(board_id) {
  var res = {};
  var lists = await trello.getListsOnBoard(board_id);
  lists.forEach(element => {
    res[element.name] = element.id;
  });
  return res;
}

main()
  .then(console.log)
  .catch(console.error)