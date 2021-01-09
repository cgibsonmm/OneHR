import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["input", "display"];
  static values = { val: String };

  initialize() {
    this.val = "";
  }

  connect() {}

  change() {
    this.val = this.targets.find("input").value;
    this.targets.find("display").textContent = this.val;
  }
}
