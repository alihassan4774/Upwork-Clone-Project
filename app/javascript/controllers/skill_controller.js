// app/javascript/controllers/skills_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["view", "edit"]

  connect() {
    console.log("Skills controller connected!") 
  }

  edit() {
    console.log("Edit clicked!") 
    console.log("View target:", this.viewTarget)
    console.log("Edit target:", this.editTarget)
    
    this.viewTarget.classList.add("hidden")
    this.editTarget.classList.remove("hidden")
  }

  cancel() {
    console.log("Cancel clicked!") 
    this.editTarget.classList.add("hidden")
    this.viewTarget.classList.remove("hidden")
  }
}