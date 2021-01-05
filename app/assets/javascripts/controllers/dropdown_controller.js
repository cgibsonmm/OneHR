import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["links", "area"];
  static values = { isToggled: Boolean };

  initialize() {
    this.isToggled = false;
  }

  connect() {
    document.addEventListener("click", (event) => this.handleClick(event));
  }

  disconnect() {
    document.removeEventListener("click", this.handleClick);
  }

  handleClick(event) {
    const div = document.getElementsByClassName("remove");
    let eventInContainer = Array.from(div).some((element) =>
      element.contains(event.target)
    );
    if (!eventInContainer && this.isToggled) {
      this.hide();
    }
  }

  toggle() {
    this.isToggled = !this.isToggled;
    this.handleDisplay();
  }

  hide() {
    this.isToggled = false;
    this.handleDisplay();
  }

  handleDisplay() {
    this.linksTarget.classList.toggle("hidden");
    this.linksTarget.classList.toggle("animate-dropDown");
  }
}
