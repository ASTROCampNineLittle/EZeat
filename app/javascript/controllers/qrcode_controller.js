import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "qrcodeBtn", "qrcodePng" ]

  generateQrcode() {
    if (qrcodePng.classList.value === "hidden") {
      qrcodePng.classList.value="show";
    } else if (qrcodePng.classList.value === "show") {
        qrcodePng.classList.value="hidden";
    }
  }
}
