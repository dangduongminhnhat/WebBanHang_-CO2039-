class Superstar extends HTMLElement {
    constructor() {
      super();
    }
    connectedCallback() {
        this.innerHTML = `
        <span class="status">New</span>
        <a href="#!">
            <img src="./assets/img/superstar.jpeg" alt="SUPERSTAR" class="img" />
            <div class="name">SUPERSTAR</div>
        </a>
        <span class="star">
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
        </span>
        <span class="price">2,200,000</span>
    `;
    }
}

customElements.define('superstar-component', Superstar);