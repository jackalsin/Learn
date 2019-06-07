package com.lightbend.akka.sample;

import akka.actor.AbstractActor;
import akka.actor.ActorRef;
import akka.actor.Props;
import com.lightbend.akka.sample.Printer.Greeting;

public class Greeter extends AbstractActor {
  /**
   * It is also a common pattern to use a static props method in the class of the Actor that describes how to
   * construct the Actor.
   *
   * @param message
   * @param printerActor
   * @return
   */
  static public Props props(String message, ActorRef printerActor) {
    return Props.create(Greeter.class, () -> new Greeter(message, printerActor));
  }

  /**
   * The receiver of the message
   */
  static public class WhoToGreet {
    public final String who;

    public WhoToGreet(String who) {
      this.who = who;
    }
  }

  /**
   * instructions to execute greeting
   */
  static public class Greet {
    public Greet() {
    }
  }

  private final String message;
  private final ActorRef printerActor;
  private String greeting = "";

  public Greeter(String message, ActorRef printerActor) {
    this.message = message;
    this.printerActor = printerActor;
  }

  @Override
  public Receive createReceive() {
    return receiveBuilder()
        .match(WhoToGreet.class, wtg -> {
          this.greeting = message + ", " + wtg.who;
        })
        .match(Greet.class, x -> {
          printerActor.tell(new Greeting(greeting), getSelf());
        })
        .build();
  }
}
