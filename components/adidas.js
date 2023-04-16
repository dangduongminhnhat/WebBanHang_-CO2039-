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

customElements.define("superstar-component", Superstar);

class Ultraboost_4_0_Dna extends HTMLElement {
    constructor() {
        super();
    }
    connectedCallback() {
        this.innerHTML = `<span class="status">New</span>
                                <a href="#!">
                                    <img
                                        src="./assets/img/ultraboost 4.0 dna.jpg"
                                        alt="ultraboost 4.0 dna"
                                        class="img" />
                                    <div class="name">ULTRABOOST 4.0 DNA</div>
                                </a>
                                <span class="star">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                </span>
                                <span class="price">3,800,000</span>`;
    }
}

customElements.define("ultraboost_4_0_dna-component", Ultraboost_4_0_Dna);

class Day_Jogger_Dash_Green_Linen extends HTMLElement {
    constructor() {
        super();
    }
    connectedCallback() {
        this.innerHTML = `<span class="status">New</span>
                                <a href="#!">
                                    <img
                                        src="./assets/img/day jogger dash green linen.jpg"
                                        alt="day jogger dash green linen"
                                        class="img" />
                                    <div class="name">DAY JOGGER DASH GREEN LINEN</div>
                                </a>
                                <span class="star">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                </span>
                                <span class="price">2,200,000</span>`;
    }
}

customElements.define("day_jogger_dash_green_linen-component", Day_Jogger_Dash_Green_Linen);

class Adidas_Ultra_4dwfd extends HTMLElement {
    constructor() {
        super();
    }
    connectedCallback() {
        this.innerHTML = `<span class="status status_hot">Hot</span>
                                <a href="#!">
                                    <img
                                        src="./assets/img/adidas ultra 4dfwd.jpg"
                                        alt="adidas ultra 4dfwd"
                                        class="img" />
                                    <div class="name">ADIDAS ULTRA 4DFWD</div>
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

customElements.define("adidas_ultra_4dwfd-component", Adidas_Ultra_4dwfd);

class Falcon_Pink_Purple extends HTMLElement {
    constructor() {
        super();
    }
    connectedCallback() {
        this.innerHTML = `<span class="status status_hot">Hot</span>
                                <a href="#!">
                                    <img
                                        src="./assets/img/falcon pink purple.jpeg"
                                        alt="jordan 1 mid tuft orange"
                                        class="img" />
                                    <div class="name">FALCON PINK PURPLE</div>
                                </a>
                                <span class="star">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                </span>
                                <span class="price">2,600,000</span>`;
    }
}

customElements.define("falcon_pink_purple-component", Falcon_Pink_Purple);

class Ultraboost_20__Metallic_Gold extends HTMLElement {
    constructor() {
        super();
    }
    connectedCallback() {
        this.innerHTML = `<span class="status status_sale">-31%</span>
                                <a href="#!">
                                    <img
                                        src="./assets/img/ultraboost 20 metallic gold.jpeg"
                                        alt="puma slipstream green"
                                        class="img" />
                                    <div class="name">ULTRABOOST 20 METALLIC GOLD</div>
                                </a>
                                <span class="star">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                </span>
                                <span class="price">2,900,000</span>
                                <span class="old_price">4,200,000</span>`;
    }
}

customElements.define("ultraboost_20__metallic_gold-component", Ultraboost_20__Metallic_Gold);

class Ultraboost_21 extends HTMLElement {
    constructor() {
        super();
    }
    connectedCallback() {
        this.innerHTML = `<span class="status status_sale">-10%</span>
                                <a href="#!">
                                    <img
                                        src="./assets/img/ultraboost 21.jpeg"
                                        alt="nike court vision low next nature"
                                        class="img" />
                                    <div class="name">ULTRABOOST 21</div>
                                </a>
                                <span class="star">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                </span>
                                <span class="price">3,800,000</span>
                                <span class="old_price">4,200,000</span>`;
    }
}

customElements.define("ultraboost_21-component", Ultraboost_21);
