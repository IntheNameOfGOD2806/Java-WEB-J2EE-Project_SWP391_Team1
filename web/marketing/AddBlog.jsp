<%-- 
    Document   : Dashboard
    Created on : Sep 25, 2023, 2:58:40 PM
    Author     : dang9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <meta name="description" content="Post Blog" />

        <!-- OG -->
        <meta property="og:title" content="Post Blog" />
        <meta property="og:description" content="Post Blog" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="../error-404.html" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="marketing/assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>Post Blog </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="marketing/assets/js/html5shiv.min.js"></script>
        <script src="marketing/assets/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="marketing/assets/css/assets.css">
        <link rel="stylesheet" type="text/css" href="marketing/assets/vendors/calendar/fullcalendar.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="marketing/assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="marketing/assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="marketing/assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="marketing/assets/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="marketing/assets/css/color/color-1.css">
        <script src="https://cdn.ckeditor.com/ckeditor5/39.0.2/super-build/ckeditor.js"></script>
    </head>
    <style>
        .ck-editor__editable[role="textbox"] {
            /* editing area */
            min-height: 300px;
        }
        .ck-content .image {
            /* block images */
            max-width: 80%;
            margin: 20px auto;
        }
        img[src=""] {
            display: none;
        }
    </style>
    <body class="ttr-opened-sidebar ttr-pinned-sidebar">
        <jsp:include page="Header.jsp"></jsp:include>
        <!--Main container start -->
        <main class="ttr-wrapper">
            <div class="container-fluid">
                <div class="db-breadcrumb">
                                <h4 class="breadcrumb-title">Add Blog</h4>
                                <ul class="db-breadcrumb-list">
                                    <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                                    <li>Add Blog</li>
                                </ul>
                            </div>
                <form id="blog" method="post" action="PostBlog" style="margin: 0px 50px 50px">
                    <label for="Title">Title:</label>
                    <input id="Title" name="Title" required="" style="width: 100%; padding: 10px; margin-bottom: 10px; border: 1px solid #ccc; border-radius: 4px;">

                    <label for="Brief">Brief:</label>
                    <input id="Brief" name="Brief" required="" style="width: 100%; padding: 10px; margin-bottom: 10px; border: 1px solid #ccc; border-radius: 4px;">

                    <label for="photo">Thumbnail:</label>
                    <img id="uploadedPhoto" width="250px" height="250px" src="" style="margin-bottom: 10px;">
                    <input type="file" id="inputPhoto" style="width: 100%; padding: 10px; margin-bottom: 10px;">
                    <input type="hidden" id="Photo" name="Photo" value="" >
                    
                    <label for="editor">Content:</label>
                    <textarea id="editor" name="Content"></textarea>
                    <input type="hidden" id="hiddenInput" value="">
                    <div>
                    <label>Image:</label>
                    <input class="col-6" type="file" id="imageInput">
                    </div>

                    <button class="btn btn-default " type="submit" name="submit" id="submit" value="add">Post Blog</button>

                </form>
            </div>
        </main>
        <div class="ttr-overlay"></div>

        <script>
            // This sample still does not showcase all CKEditor&nbsp;5 features (!)
            // Visit https://ckeditor.com/docs/ckeditor5/latest/features/index.html to browse all the features.
            let editor;
            CKEDITOR.ClassicEditor.create(document.getElementById("editor"), {
                // https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format
                toolbar: {
                    items: [
                        'exportPDF', 'exportWord', '|',
                        'findAndReplace', 'selectAll', '|',
                        'heading', '|',
                        'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
                        'bulletedList', 'numberedList', 'todoList', '|',
                        'outdent', 'indent', '|',
                        'undo', 'redo',
                        '-',
                        'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
                        'alignment', '|',
                        'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
                        'specialCharacters', 'horizontalLine', 'pageBreak', '|',
                        'textPartLanguage', '|',
                        'sourceEditing'
                    ],
                    shouldNotGroupWhenFull: true
                },
                // Changing the language of the interface requires loading the language file using the <script> tag.
                // language: 'es',
                list: {
                    properties: {
                        styles: true,
                        startIndex: true,
                        reversed: true
                    }
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
                heading: {
                    options: [
                        {model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph'},
                        {model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1'},
                        {model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2'},
                        {model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3'},
                        {model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4'},
                        {model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5'},
                        {model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6'}
                    ]
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
                placeholder: 'Write blog here',
                // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
                fontFamily: {
                    options: [
                        'default',
                        'Arial, Helvetica, sans-serif',
                        'Courier New, Courier, monospace',
                        'Georgia, serif',
                        'Lucida Sans Unicode, Lucida Grande, sans-serif',
                        'Tahoma, Geneva, sans-serif',
                        'Times New Roman, Times, serif',
                        'Trebuchet MS, Helvetica, sans-serif',
                        'Verdana, Geneva, sans-serif'
                    ],
                    supportAllValues: true
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
                fontSize: {
                    options: [10, 12, 14, 'default', 18, 20, 22],
                    supportAllValues: true
                },
                // Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
                // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
                htmlSupport: {
                    allow: [
                        {
                            name: /.*/,
                            attributes: true,
                            classes: true,
                            styles: true
                        }
                    ]
                },
                // Be careful with enabling previews
                // https://ckeditor.com/docs/ckeditor5/latest/features/html-embed.html#content-previews
                htmlEmbed: {
                    showPreviews: true
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/link.html#custom-link-attributes-decorators
                link: {
                    decorators: {
                        addTargetToExternalLinks: true,
                        defaultProtocol: 'https://',
                        toggleDownloadable: {
                            mode: 'manual',
                            label: 'Downloadable',
                            attributes: {
                                download: 'file'
                            }
                        }
                    }
                },
                // https://ckeditor.com/docs/ckeditor5/latest/features/mentions.html#configuration
                mention: {
                    feeds: [
                        {
                            marker: '@',
                            feed: [
                                '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
                                '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
                                '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
                                '@sugar', '@sweet', '@topping', '@wafer'
                            ],
                            minimumCharacters: 1
                        }
                    ]
                },
                // The "super-build" contains more premium features that require additional configuration, disable them below.
                // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
                removePlugins: [
                    // These two are commercial, but you can try them out without registering to a trial.
                    // 'ExportPdf',
                    // 'ExportWord',
                    'CKBox',
                    'CKFinder',
                    'EasyImage',
                    // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
                    // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
                    // Storing images as Base64 is usually a very bad idea.
                    // Replace it on production website with other solutions:
                    // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
                    // 'Base64UploadAdapter',
                    'RealTimeCollaborativeComments',
                    'RealTimeCollaborativeTrackChanges',
                    'RealTimeCollaborativeRevisionHistory',
                    'PresenceList',
                    'Comments',
                    'TrackChanges',
                    'TrackChangesData',
                    'RevisionHistory',
                    'Pagination',
                    'WProofreader',
                    // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
                    // from a local file system (file://) - load this site via HTTP server if you enable MathType.
                    'MathType',
                    // The following features are part of the Productivity Pack and require additional license.
                    'SlashCommand',
                    'Template',
                    'DocumentOutline',
                    'FormatPainter',
                    'TableOfContents',
                    'PasteFromOfficeEnhanced'
                ]
            })
                    .then(newEditor => {
                        editor = newEditor;
                    })
                    .catch(error => {
                        console.error(error);
                    });
        </script>

        <script src="marketing/assets/js/uploadimage.js"></script>
        <script src="marketing/assets/js/jquery.min.js"></script>
        <script src="marketing/assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="marketing/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="marketing/assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="marketing/assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="marketing/assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="marketing/assets/vendors/counter/waypoints-min.js"></script>
        <script src="marketing/assets/vendors/counter/counterup.min.js"></script>
        <script src="marketing/assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="marketing/assets/vendors/masonry/masonry.js"></script>
        <script src="marketing/assets/vendors/masonry/filter.js"></script>
        <script src="marketing/assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="marketing/assets/vendors/scroll/scrollbar.min.js"></script>
        <script src="marketing/assets/js/functions.js"></script>
        <script src="marketing/assets/vendors/chart/chart.min.js"></script>
        <script src="marketing/assets/js/admin.js"></script>
    </body>

    <!-- Mirrored from educhamp.themetrades.com/demo/admin/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 22 Feb 2019 13:09:05 GMT -->
</html>
