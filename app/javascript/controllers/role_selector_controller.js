import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["radio", "button"]

  connect() {
    // Jab controller load ho
    this.radioTargets.forEach(radio => {
      radio.addEventListener("change", () => {
        this.enableButton()
      })
    })
  }

  enableButton() {
    this.buttonTarget.disabled = false

    this.buttonTarget.classList.remove(
      "bg-gray-200",
      "text-gray-400",
      "cursor-not-allowed"
    )

    this.buttonTarget.classList.add(
      "bg-green-600",
      "text-white",
      "cursor-pointer"
    )
  }
}
