import reset from 'styled-reset';
import { createGlobalStyle } from 'styled-components';

const globalStyle = createGlobalStyle`
    ${reset}
    * {
        box-sizing: border-box;
    }
    html {
        font-size:100.01%;
    }
    body {
        font:normal 1rem "애플고딕", AppleGothic, "돋움", dotum, Arial, Verdana, sans-serif;
        line-height:1.3;
        color:#666666;
        background-color:#fff;
        margin:0;
        padding:100px;
    }
    br	{
        letter-spacing: 0;
    }
    h1, h2, h3, h4, h5, h6 {
        font-size:1rem;
    }
    h1, h2, h3, h4, h5, h6, div, p, dl, dt, dd, ul, ol, li, form, fieldset, blockquote, address, table, thead, tbody, tfoot, tr, td, caption, button {
        margin:0;
        padding:0;
    }
    ul, ol {
        list-style:none;
    }
    img {
        border:0;
    }
    table {
        width:100%;
        border-collapse: collapse;
        font-size:1rem;
    }
    
    a:link, a:visited {
        color: #666666;
        text-decoration:none;
    }
    a:hover {
        color: #666666;
        text-decoration:none;
    }
    fieldset {
        border:0;
    }
    legend {
        display:none;
    }
    select, input, textarea {
        font:normal 1rem "애플고딕", AppleGothic, "굴림", gulim, Arial, Verdana, sans-serif;
        color:#797b80;
        vertical-align:middle;
    }
    button {
        background-color: #fff; 
        border: none;
    }
    button:focus {outline: none}
    em {
        font-style: normal;
    }
    hr {
        clear:both;	
        height:0; 
        visibility:hidden; 
        overflow:hidden;
        display: none;
    }
`;

export default globalStyle;
