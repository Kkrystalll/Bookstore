import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["totel"]

  connect() {}

  add_to_cart(e) {
    const { bookId } = e.target.dataset
    const { userId } = e.target.dataset

    const data = new FormData()
    data.append("book_id", bookId)
    data.append("user_id", userId)

    Rails.ajax({
      type: "post",
      url: "/api/v1/orders/add_to_cart",
      data,
      success: ({ message }) => {
        const header = document.querySelector(".header")
        header.insertAdjacentHTML(
          "afterend",
          `<div
        data-controller="notification"
        class="notice hidden"
        data-notification-delay-value="5000"
        data-transition-enter-from="opacity-0 translate-x-6"
        data-transition-enter-to="opacity-100 translate-x-0"
        data-transition-leave-from="opacity-100 translate-x-0"
        data-transition-leave-to="opacity-0 translate-x-6">
          <p id="notice">${message}</p>
          <button data-action="notification#hide" class="notice-button"><i class="fas fa-times-circle"></i></button>
        </div>`
        )
      },
      error: (err) => {
        console.log(err)
      },
    })
  }

  remove_to_cart(e) {
    const { bookId } = e.target.dataset
    const { orderId } = e.target.dataset

    const data = new FormData()
    data.append("book_id", bookId)

    Rails.ajax({
      type: "delete",
      url: `/api/v1/orders/${orderId}/remove_to_cart`,
      data,
      success: ({ message }) => {
        e.target.closest(".book_order").classList.add("hidden")
        const header = document.querySelector(".header")
        header.insertAdjacentHTML(
          "afterend",
          `<div
          data-controller="notification"
          class="alert hidden"
          data-notification-delay-value="5000"
          data-transition-enter-from="opacity-0 translate-x-6"
          data-transition-enter-to="opacity-100 translate-x-0"
          data-transition-leave-from="opacity-100 translate-x-0"
          data-transition-leave-to="opacity-0 translate-x-6">
            <p id="alert">${message}</p>
            <button data-action="notification#hide" class="notice-button"><i class="fas fa-times-circle"></i></button>
          </div>`
        )
        const originAmount = this.totelTarget.textContent.slice(4, -1)
        const removeBookPrice = e.target.dataset.bookPrice

        this.totelTarget.textContent = `總計：＄${originAmount - removeBookPrice}元`
      },
    })
  }
}
