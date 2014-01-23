var xslDoc;
var xmlDoc;
var xmlHttpObj;
// var sortKey = {'name', "category","expiration", "price", "stock"};
var  =  "name";
var key = "name";
var sortOrder = 'ascending'
var sortType = 'text';

function CreateXmlHttpRequestObject()
{
    var xmlObj;
    
    if (window.ActiveXObject) {
        alert('Sorry, old browsers are not supported!\nTo run the project open the .xsl file, uncomment first lines and then open the .xml file!');
        window.stop();
    } else {
        xmlObj = new XMLHttpRequest();
    }
    
    return xmlObj;
}

function getStyleSheet()
{
    xmlHttpObj = CreateXmlHttpRequestObject();
    try {
        xmlHttpObj.open('GET', '18_61534_61488_description_xslt.xsl', false);
        xmlHttpObj.send(null);
    } catch (e) {
        alert('You must fix your browser\'s security settings!\nTry with Firefox.\nFor Chrome --disable-web-security.\nTo run the project open the .xsl file, uncomment first lines and then open the .xml file!');
    }
    if (xmlHttpObj.status == 200 || xmlHttpObj.status == 0) {
        xslDoc = xmlHttpObj.responseXML; 
    } else {
        alert('error loading stylesheet ' + xmlHttpObj.status);
    }
}

function getDataFile()
{
    xmlHttpObj = CreateXmlHttpRequestObject();    
    xmlHttpObj.open('GET', '18_61534_61488_description_xml.xml', false);
    xmlHttpObj.send(null);

    if (xmlHttpObj.status == 200 || xmlHttpObj.status == 0) {
        xmlDoc = xmlHttpObj.responseXML;
    } else {
        alert('error loading data file ' + xmlHttpObj.status);
    }
}

function doTranslation()
{
    try {
        var processor = new XSLTProcessor();
        processor.importStylesheet(xslDoc);
        processor.setParameter(null, 'sortKey', sortKey);
        processor.setParameter(null, 'sortOrder', sortOrder);
        processor.setParameter(null, 'sortType', sortType);
        var newDocument = processor.transformToDocument(xmlDoc);
        document.getElementById('table').innerHTML = new XMLSerializer().serializeToString(newDocument);
                console.log(xmlDoc);

    } catch (e) {
        alert('error translating data file');
    }
}


function initialize()
{
    getStyleSheet();
    getDataFile();
    doTranslation();
}


function reSort(which)
{
    if (sortKey == which) {
        sortOrder = (sortOrder == 'ascending') ? 'descending' : 'ascending';
    } else {
        sortKey = which;
        sortOrder = 'ascending';
    }
    sortType = ( sortKey == 'price' || sortKey.match(/[a-z]{4}(le_name)/) ) ? 'number' : 'text';
    console.log(sortKey);
    console.log(sortOrder);
    console.log(sortType);
    // for (var i = sortKey.length - 1; i >= 0; i--) {
    //     sortKey[i]
    //     switch (sortKey[i]) {
    // case "name":
    //     key = sortKey[i];
    //     sortOrder = (sortOrder == 'ascending') ? 'descending' : 'ascending';
    //     sortType = "text";
    //     break;
    // case "price":
    //     key = sortKey[i];
    //     sortOrder = (sortOrder == 'ascending') ? 'descending' : 'ascending';
    //     sortType = "number";
    //     break;
// }
//     };
    doTranslation();
}
