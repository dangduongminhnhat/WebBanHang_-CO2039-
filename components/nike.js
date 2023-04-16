class Jordan_1_Mid_Tuft_Orange extends HTMLElement {
    constructor() {
      super();
    }
    connectedCallback() {
        this.innerHTML = `<span class="status">New</span>
        <a href="#!">
            <img
                src="./assets/img/jordan 1 mid tuft orange.jpeg"
                alt="jordan 1 mid tuft orange"
                class="img" />
            <div class="name">JORDAN 1 MID TUFT ORANGE</div>
        </a>
        <span class="star">
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
        </span>
        <span class="price">5,800,000</span>`;
    }
}

customElements.define('jordan_1_mid_tuft_orange-component', Jordan_1_Mid_Tuft_Orange);

