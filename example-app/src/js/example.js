import { WebViewConfigurator } from '@neosyn-ee/web-view-configurator';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    WebViewConfigurator.echo({ value: inputValue })
}
