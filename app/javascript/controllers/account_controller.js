import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["view", "edit"]

  edit() {
    this.viewTarget.classList.add("hidden")
    this.editTarget.classList.remove("hidden")
  }

  cancel() {
    this.editTarget.classList.add("hidden")
    this.viewTarget.classList.remove("hidden")
  }
}
