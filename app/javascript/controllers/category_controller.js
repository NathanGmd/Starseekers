import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category"
export default class extends Controller {
  static targets = ["categoryName"];

  connect() {
    console.log("hello form category controller")
    console.log(this.categoryNameTarget.textContent);
    console.log(this)
  }
}
