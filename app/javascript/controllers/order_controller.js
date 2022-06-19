import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["output"]

  connect() {}

  add_to_cart(e) {
    const { bookId } = e.target.dataset
    const { userId } = e.target.dataset

    const data = new FormData()
    data.append("book_id", bookId)
    data.append("user_id", userId)

    Rails.ajax({
      type: "post",
      url: `/api/v1/orders/add_to_cart`,
      data,
      success: (resp) => {
        console.log(resp)
      },
      error: (err) => {
        console.log(err)
      },
    })
  }
}
