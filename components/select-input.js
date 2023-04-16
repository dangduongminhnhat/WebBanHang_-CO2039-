class Select_Input extends HTMLElement {
    constructor() {
        super();
    }
    connectedCallback() {
        this.innerHTML = `<div class="selection">
            <div class="sub_content">
                <div class="filter">
                    <!-- Tạo thanh tìm kiếm -->
                    <div class="select-input">
                        <input type="text" id="input_bar" class="search-input_bar" placeholder="Chọn Size Giày" />
                        <ul class="select-input_list">
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">38</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">39</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">40</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">40.5</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">41</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">41.5</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">42</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">42.5</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">43</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">44</a>
                            </li>
                        </ul>
                    </div>

                    <div class="select-input">
                        <input type="text" id="input_bar" class="search-input_bar" placeholder="Khoảng Giá" />
                        <ul class="select-input_list">
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Dưới 3 Triệu</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Từ 3 Đến 5 Triệu</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Từ 5 Đến 10 Triệu</a>
                            </li>
                        </ul>
                    </div>

                    <div class="select-input">
                        <input type="text" id="input_bar" class="search-input_bar" placeholder="Thương Hiệu" />
                        <ul class="select-input_list">
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Nike</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Adidas</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Biti's</a>
                            </li>
                        </ul>
                    </div>

                    <div class="select-input">
                        <input type="text" id="input_bar" class="search-input_bar" placeholder="Phân Loại" />
                        <ul class="select-input_list">
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Giày Đi Với Crush</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Giày Thể Thao</a>
                            </li>
                        </ul>
                    </div>

                    <div class="select-input">
                        <input type="text" id="input_bar" class="search-input_bar" placeholder="Sắp Xếp Theo" />
                        <ul class="select-input_list">
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Giá Thấp Đến Cao</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Giá Cao Đến Thấp</a>
                            </li>
                            <li class="select-input_item">
                                <a href="#!" class="select-input_link">Giảm Giá Nhiều Nhất</a>
                            </li>
                        </ul>
                    </div>

                    <div class="select-input select-input_last">
                        <a href="#!">
                            Tìm Kiếm Ngay
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </a>
                    </div>

                    <div class="filter_page">
                        <span class="filter_page-num"> <span class="filter_page-current">1</span>/3 </span>

                        <div class="filter_page-control">
                            <!-- Disabled: filter_page-btn-disabled -->
                            <a href="#!" class="filter_page-btn filter_page-btn-disabled">
                                <i class="filter_page-icon fa-solid fa-chevron-left"></i>
                            </a>
                            <a href="#!" class="filter_page-btn">
                                <i class="filter_page-icon fa-solid fa-chevron-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>`;
    }
}

customElements.define("select_input-component", Select_Input);
