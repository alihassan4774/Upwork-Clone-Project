import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // HTML ke elements jin par JS control chahiye
  static targets = ["view", "edit"]

  // Edit button click par
  edit() {
    this.viewTarget.classList.add("hidden")
    this.editTarget.classList.remove("hidden")
  }

  // Cancel button click par
  cancel() {
    this.editTarget.classList.add("hidden")
    this.viewTarget.classList.remove("hidden")
  }
}
