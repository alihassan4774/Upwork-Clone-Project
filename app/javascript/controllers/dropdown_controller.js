// app/javascript/controllers/dropdown_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "menu"]

  connect() {
    this.menuTarget.classList.add("hidden")
  }

  toggle(event) {
    event.stopPropagation()
    this.menuTarget.classList.toggle("hidden")
  }

  preventClose(event) {
    event.stopPropagation()
  }

  close() {
    this.menuTarget.classList.add("hidden")
  }
}
