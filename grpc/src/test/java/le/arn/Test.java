package le.arn;

import le.arn.GreetingProtos.Greeting;
import org.junit.jupiter.api.Test;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import static org.junit.jupiter.api.Assertions.assertEquals;


class TestGreetingProtos {
  private static final String HELLO_WORLD = "Hello World";
  private static final String SRC_FILE = TestGreetingProtos.class.getName() + ".tmp";

  @Test
  void testOnlineCase1() {
    // 1 : Create a Greeting object using the Protobuf builder.
    Greeting.Builder greetingBuilder = Greeting.newBuilder();
    greetingBuilder.setGreeting(HELLO_WORLD);
    Greeting greeting = greetingBuilder.build();
    try {
      // 2 : Write the message into a file. Serialize the object.
      FileOutputStream output = new FileOutputStream(SRC_FILE);
      greeting.writeTo(output);
      output.close();
      // 3 : Deserialize the object from the file.
      Greeting greetingFromFile = Greeting.parseFrom(new FileInputStream(
          SRC_FILE));
      System.out.println(String.format("We read this from the file %s", greetingFromFile));
      // 4 : All is well?
      assertEquals(HELLO_WORLD, greetingFromFile.getGreeting());
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
}
