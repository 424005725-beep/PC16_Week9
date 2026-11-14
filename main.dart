class CoffeeMaker {
  String brand;
  int maxTankCapacity;
  int _waterLevel;
  List<String> brewHistory = [];

  CoffeeMaker(this.brand, this.maxTankCapacity, this._waterLevel);

  int get waterLevel => _waterLevel;

  void refillWater(int cups) {
    if (cups <= 0) {
      print("[$brand] Error: Refill amount must be at least 1 cup.");
      return;
    }

    if (_waterLevel + cups > maxTankCapacity) {
      _waterLevel = maxTankCapacity;
      print(
        "[$brand] Tank filled to maximum capacity ($maxTankCapacity cups).",
      );
    } else {
      _waterLevel += cups;
      print(
        "[$brand] Added $cups cup(s). Current water level: $_waterLevel/$maxTankCapacity.",
      );
    }
  }

  void brewCoffee(String coffeeType, int cupsRequested) {
    if (cupsRequested <= 0) {
      print("[$brand] Error: Request at least 1 cup.");
      return;
    }

    if (cupsRequested > _waterLevel) {
      print(
        "[$brand] Insufficient water ($_waterLevel cups left) to brew $cupsRequested cup(s) of $coffeeType.",
      );
      return;
    }

    _waterLevel -= cupsRequested;
    brewHistory.add("$cupsRequested cup(s) of $coffeeType");
    print(
      "[$brand] Brewing $cupsRequested cup(s) of $coffeeType... Done! Remaining water: $_waterLevel cup(s).",
    );
  }

  void showStatus() {
    print(
      "Machine: $brand | Water: $_waterLevel/$maxTankCapacity cups | Orders completed: ${brewHistory.length}",
    );
  }
}

void main() {
  print("=== Smart Coffee Maker OOP System ===\n");

  CoffeeMaker homeMachine = CoffeeMaker("Breville Bambino", 5, 3);
  CoffeeMaker officeMachine = CoffeeMaker("Nespresso Vertuo", 10, 8);

  List<CoffeeMaker> machines = [homeMachine, officeMachine];

  homeMachine.brewCoffee("Espresso", 2);
  homeMachine.brewCoffee("Latte", 2);
  homeMachine.refillWater(4);
  homeMachine.brewCoffee("Latte", 2);

  print("");

  officeMachine.brewCoffee("Americano", 4);
  officeMachine.brewCoffee("Cappuccino", 3);

  print("\n=== Fleet Summary ===");
  for (CoffeeMaker machine in machines) {
    machine.showStatus();
    print("  Brew History: ${machine.brewHistory}");
  }
}
