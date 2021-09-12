// // To parse this JSON data, do
// //
// //     final news = newsFromMap(jsonString);

// import 'dart:convert';

// News newsFromMap(String str) => News.fromMap(json.decode(str));

// String newsToMap(News data) => json.encode(data.toMap());

// class News {
//   News({
//     this.namespace,
//     this.routes,
//     this.links,
//   });

//   final String namespace;
//   final Routes routes;
//   final NewsLinks links;

//   factory News.fromMap(Map<String, dynamic> json) => News(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         routes: json["routes"] == null ? null : Routes.fromMap(json["routes"]),
//         links:
//             json["_links"] == null ? null : NewsLinks.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "routes": routes == null ? null : routes.toMap(),
//         "_links": links == null ? null : links.toMap(),
//       };
// }

// class NewsLinks {
//   NewsLinks({
//     this.up,
//   });

//   final List<Up> up;

//   factory NewsLinks.fromMap(Map<String, dynamic> json) => NewsLinks(
//         up: json["up"] == null
//             ? null
//             : List<Up>.from(json["up"].map((x) => Up.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "up": up == null ? null : List<dynamic>.from(up.map((x) => x.toMap())),
//       };
// }

// class Up {
//   Up({
//     this.href,
//   });

//   final String href;

//   factory Up.fromMap(Map<String, dynamic> json) => Up(
//         href: json["href"] == null ? null : json["href"],
//       );

//   Map<String, dynamic> toMap() => {
//         "href": href == null ? null : href,
//       };
// }

// class Routes {
//   Routes({
//     this.wpV2,
//     this.wpV2Posts,
//     this.wpV2PostsPIdD,
//     this.wpV2PostsPParentDRevisions,
//     this.wpV2PostsPParentDRevisionsPIdD,
//     this.wpV2PostsPIdDAutosaves,
//     this.wpV2PostsPParentDAutosavesPIdD,
//     this.wpV2Pages,
//     this.wpV2PagesPIdD,
//     this.wpV2PagesPParentDRevisions,
//     this.wpV2PagesPParentDRevisionsPIdD,
//     this.wpV2PagesPIdDAutosaves,
//     this.wpV2PagesPParentDAutosavesPIdD,
//     this.wpV2Media,
//     this.wpV2MediaPIdD,
//     this.wpV2MediaPIdDPostProcess,
//     this.wpV2MediaPIdDEdit,
//     this.wpV2Blocks,
//     this.wpV2BlocksPIdD,
//     this.wpV2BlocksPParentDRevisions,
//     this.wpV2BlocksPParentDRevisionsPIdD,
//     this.wpV2BlocksPIdDAutosaves,
//     this.wpV2BlocksPParentDAutosavesPIdD,
//     this.wpV2Templates,
//     this.wpV2TemplatesPIdW,
//     this.wpV2TemplatesPParentDRevisions,
//     this.wpV2TemplatesPParentDRevisionsPIdD,
//     this.wpV2TemplatesPIdDAutosaves,
//     this.wpV2TemplatesPParentDAutosavesPIdD,
//     this.wpV2Types,
//     this.wpV2TypesPTypeW,
//     this.wpV2Statuses,
//     this.wpV2StatusesPStatusW,
//     this.wpV2Taxonomies,
//     this.wpV2TaxonomiesPTaxonomyW,
//     this.wpV2Categories,
//     this.wpV2CategoriesPIdD,
//     this.wpV2Tags,
//     this.wpV2TagsPIdD,
//     this.wpV2Users,
//     this.wpV2UsersPIdD,
//     this.wpV2UsersMe,
//     this.wpV2UsersPUserIdDMeApplicationPasswords,
//     this.wpV2UsersPUserIdDMeApplicationPasswordsIntrospect,
//     this.wpV2UsersPUserIdDMeApplicationPasswordsPUuidW,
//     this.wpV2Comments,
//     this.wpV2CommentsPIdD,
//     this.wpV2Search,
//     this.wpV2BlockRendererPNameAZ09AZ09,
//     this.wpV2BlockTypes,
//     this.wpV2BlockTypesPNamespaceAZAZ09,
//     this.wpV2BlockTypesPNamespaceAZAZ09PNameAZAZ09,
//     this.wpV2Settings,
//     this.wpV2Themes,
//     this.wpV2ThemesPStylesheetW,
//     this.wpV2Plugins,
//     this.wpV2PluginsPPlugin,
//     this.wpV2Sidebars,
//     this.wpV2SidebarsPIdW,
//     this.wpV2WidgetTypes,
//     this.wpV2WidgetTypesPIdAZAZ09,
//     this.wpV2WidgetTypesPIdAZAZ09Encode,
//     this.wpV2Widgets,
//     this.wpV2WidgetsPIdW,
//     this.wpV2BlockDirectorySearch,
//     this.wpV2PatternDirectoryPatterns,
//   });

//   final WpV2 wpV2;
//   final WpV2MediaClass wpV2Posts;
//   final WpV2P wpV2PostsPIdD;
//   final WpV2SPParentDRevisions wpV2PostsPParentDRevisions;
//   final WpV2BlocksPParentDAutosavesPIdDClass wpV2PostsPParentDRevisionsPIdD;
//   final WpV2P wpV2PostsPIdDAutosaves;
//   final WpV2BlocksPParentDAutosavesPIdDClass wpV2PostsPParentDAutosavesPIdD;
//   final WpV2MediaClass wpV2Pages;
//   final WpV2P wpV2PagesPIdD;
//   final WpV2SPParentDRevisions wpV2PagesPParentDRevisions;
//   final WpV2BlocksPParentDAutosavesPIdDClass wpV2PagesPParentDRevisionsPIdD;
//   final WpV2P wpV2PagesPIdDAutosaves;
//   final WpV2BlocksPParentDAutosavesPIdDClass wpV2PagesPParentDAutosavesPIdD;
//   final WpV2MediaClass wpV2Media;
//   final WpV2MediaPIdD wpV2MediaPIdD;
//   final WpV2MediaPIdDPostProcess wpV2MediaPIdDPostProcess;
//   final WpV2MediaPIdDEdit wpV2MediaPIdDEdit;
//   final WpV2Blocks wpV2Blocks;
//   final WpV2BlocksPIdD wpV2BlocksPIdD;
//   final WpV2SPParentDRevisions wpV2BlocksPParentDRevisions;
//   final WpV2BlocksPParentDAutosavesPIdDClass wpV2BlocksPParentDRevisionsPIdD;
//   final WpV2BlocksPIdD wpV2BlocksPIdDAutosaves;
//   final WpV2BlocksPParentDAutosavesPIdDClass wpV2BlocksPParentDAutosavesPIdD;
//   final WpV2Templates wpV2Templates;
//   final WpV2TemplatesPId wpV2TemplatesPIdW;
//   final WpV2SPParentDRevisions wpV2TemplatesPParentDRevisions;
//   final WpV2BlocksPParentDAutosavesPIdDClass wpV2TemplatesPParentDRevisionsPIdD;
//   final WpV2TemplatesPId wpV2TemplatesPIdDAutosaves;
//   final WpV2BlocksPParentDAutosavesPIdDClass wpV2TemplatesPParentDAutosavesPIdD;
//   final WpV2SidebarsClass wpV2Types;
//   final WpV2T wpV2TypesPTypeW;
//   final WpV2SidebarsClass wpV2Statuses;
//   final WpV2StatusesPStatusW wpV2StatusesPStatusW;
//   final WpV2T wpV2Taxonomies;
//   final WpV2TaxonomiesPTaxonomyW wpV2TaxonomiesPTaxonomyW;
//   final WpV2CategoriesClass wpV2Categories;
//   final WpV2CategoriesPIdDClass wpV2CategoriesPIdD;
//   final WpV2CategoriesClass wpV2Tags;
//   final WpV2CategoriesPIdDClass wpV2TagsPIdD;
//   final WpV2Users wpV2Users;
//   final WpV2UsersPIdD wpV2UsersPIdD;
//   final WpV2UsersMe wpV2UsersMe;
//   final WpV2UsersPUserIdDMeApplicationPasswords
//       wpV2UsersPUserIdDMeApplicationPasswords;
//   final WpV2SidebarsClass wpV2UsersPUserIdDMeApplicationPasswordsIntrospect;
//   final WpV2UsersPUserIdDMeApplicationPasswords
//       wpV2UsersPUserIdDMeApplicationPasswordsPUuidW;
//   final WpV2Comments wpV2Comments;
//   final WpV2CommentsPIdD wpV2CommentsPIdD;
//   final WpV2Search wpV2Search;
//   final WpV2BlockRendererPNameAZ09AZ09 wpV2BlockRendererPNameAZ09AZ09;
//   final WpV2BlockTypes wpV2BlockTypes;
//   final WpV2BlockTypes wpV2BlockTypesPNamespaceAZAZ09;
//   final WpV2BlockTypesPNamespaceAZAZ09PNameAZAZ09
//       wpV2BlockTypesPNamespaceAZAZ09PNameAZAZ09;
//   final WpV2Settings wpV2Settings;
//   final WpV2Themes wpV2Themes;
//   final WpV2ThemesPStylesheetW wpV2ThemesPStylesheetW;
//   final WpV2Plugins wpV2Plugins;
//   final WpV2PluginsPPlugin wpV2PluginsPPlugin;
//   final WpV2SidebarsClass wpV2Sidebars;
//   final WpV2SidebarsPIdW wpV2SidebarsPIdW;
//   final WpV2SidebarsClass wpV2WidgetTypes;
//   final WpV2WidgetTypesPIdAZAZ09 wpV2WidgetTypesPIdAZAZ09;
//   final WpV2WidgetTypesPIdAZAZ09Encode wpV2WidgetTypesPIdAZAZ09Encode;
//   final WpV2Widgets wpV2Widgets;
//   final WpV2WidgetsPIdW wpV2WidgetsPIdW;
//   final WpV2BlockDirectorySearch wpV2BlockDirectorySearch;
//   final WpV2PatternDirectoryPatterns wpV2PatternDirectoryPatterns;

//   factory Routes.fromMap(Map<String, dynamic> json) => Routes(
//         wpV2: json["/wp/v2"] == null ? null : WpV2.fromMap(json["/wp/v2"]),
//         wpV2Posts: json["/wp/v2/posts"] == null
//             ? null
//             : WpV2MediaClass.fromMap(json["/wp/v2/posts"]),
//         wpV2PostsPIdD: json["/wp/v2/posts/(?P<id>[\\d]+)"] == null
//             ? null
//             : WpV2P.fromMap(json["/wp/v2/posts/(?P<id>[\\d]+)"]),
//         wpV2PostsPParentDRevisions:
//             json["/wp/v2/posts/(?P<parent>[\\d]+)/revisions"] == null
//                 ? null
//                 : WpV2SPParentDRevisions.fromMap(
//                     json["/wp/v2/posts/(?P<parent>[\\d]+)/revisions"]),
//         wpV2PostsPParentDRevisionsPIdD:
//             json["/wp/v2/posts/(?P<parent>[\\d]+)/revisions/(?P<id>[\\d]+)"] ==
//                     null
//                 ? null
//                 : WpV2BlocksPParentDAutosavesPIdDClass.fromMap(json[
//                     "/wp/v2/posts/(?P<parent>[\\d]+)/revisions/(?P<id>[\\d]+)"]),
//         wpV2PostsPIdDAutosaves:
//             json["/wp/v2/posts/(?P<id>[\\d]+)/autosaves"] == null
//                 ? null
//                 : WpV2P.fromMap(json["/wp/v2/posts/(?P<id>[\\d]+)/autosaves"]),
//         wpV2PostsPParentDAutosavesPIdD:
//             json["/wp/v2/posts/(?P<parent>[\\d]+)/autosaves/(?P<id>[\\d]+)"] ==
//                     null
//                 ? null
//                 : WpV2BlocksPParentDAutosavesPIdDClass.fromMap(json[
//                     "/wp/v2/posts/(?P<parent>[\\d]+)/autosaves/(?P<id>[\\d]+)"]),
//         wpV2Pages: json["/wp/v2/pages"] == null
//             ? null
//             : WpV2MediaClass.fromMap(json["/wp/v2/pages"]),
//         wpV2PagesPIdD: json["/wp/v2/pages/(?P<id>[\\d]+)"] == null
//             ? null
//             : WpV2P.fromMap(json["/wp/v2/pages/(?P<id>[\\d]+)"]),
//         wpV2PagesPParentDRevisions:
//             json["/wp/v2/pages/(?P<parent>[\\d]+)/revisions"] == null
//                 ? null
//                 : WpV2SPParentDRevisions.fromMap(
//                     json["/wp/v2/pages/(?P<parent>[\\d]+)/revisions"]),
//         wpV2PagesPParentDRevisionsPIdD:
//             json["/wp/v2/pages/(?P<parent>[\\d]+)/revisions/(?P<id>[\\d]+)"] ==
//                     null
//                 ? null
//                 : WpV2BlocksPParentDAutosavesPIdDClass.fromMap(json[
//                     "/wp/v2/pages/(?P<parent>[\\d]+)/revisions/(?P<id>[\\d]+)"]),
//         wpV2PagesPIdDAutosaves:
//             json["/wp/v2/pages/(?P<id>[\\d]+)/autosaves"] == null
//                 ? null
//                 : WpV2P.fromMap(json["/wp/v2/pages/(?P<id>[\\d]+)/autosaves"]),
//         wpV2PagesPParentDAutosavesPIdD:
//             json["/wp/v2/pages/(?P<parent>[\\d]+)/autosaves/(?P<id>[\\d]+)"] ==
//                     null
//                 ? null
//                 : WpV2BlocksPParentDAutosavesPIdDClass.fromMap(json[
//                     "/wp/v2/pages/(?P<parent>[\\d]+)/autosaves/(?P<id>[\\d]+)"]),
//         wpV2Media: json["/wp/v2/media"] == null
//             ? null
//             : WpV2MediaClass.fromMap(json["/wp/v2/media"]),
//         wpV2MediaPIdD: json["/wp/v2/media/(?P<id>[\\d]+)"] == null
//             ? null
//             : WpV2MediaPIdD.fromMap(json["/wp/v2/media/(?P<id>[\\d]+)"]),
//         wpV2MediaPIdDPostProcess:
//             json["/wp/v2/media/(?P<id>[\\d]+)/post-process"] == null
//                 ? null
//                 : WpV2MediaPIdDPostProcess.fromMap(
//                     json["/wp/v2/media/(?P<id>[\\d]+)/post-process"]),
//         wpV2MediaPIdDEdit: json["/wp/v2/media/(?P<id>[\\d]+)/edit"] == null
//             ? null
//             : WpV2MediaPIdDEdit.fromMap(
//                 json["/wp/v2/media/(?P<id>[\\d]+)/edit"]),
//         wpV2Blocks: json["/wp/v2/blocks"] == null
//             ? null
//             : WpV2Blocks.fromMap(json["/wp/v2/blocks"]),
//         wpV2BlocksPIdD: json["/wp/v2/blocks/(?P<id>[\\d]+)"] == null
//             ? null
//             : WpV2BlocksPIdD.fromMap(json["/wp/v2/blocks/(?P<id>[\\d]+)"]),
//         wpV2BlocksPParentDRevisions:
//             json["/wp/v2/blocks/(?P<parent>[\\d]+)/revisions"] == null
//                 ? null
//                 : WpV2SPParentDRevisions.fromMap(
//                     json["/wp/v2/blocks/(?P<parent>[\\d]+)/revisions"]),
//         wpV2BlocksPParentDRevisionsPIdD:
//             json["/wp/v2/blocks/(?P<parent>[\\d]+)/revisions/(?P<id>[\\d]+)"] ==
//                     null
//                 ? null
//                 : WpV2BlocksPParentDAutosavesPIdDClass.fromMap(json[
//                     "/wp/v2/blocks/(?P<parent>[\\d]+)/revisions/(?P<id>[\\d]+)"]),
//         wpV2BlocksPIdDAutosaves:
//             json["/wp/v2/blocks/(?P<id>[\\d]+)/autosaves"] == null
//                 ? null
//                 : WpV2BlocksPIdD.fromMap(
//                     json["/wp/v2/blocks/(?P<id>[\\d]+)/autosaves"]),
//         wpV2BlocksPParentDAutosavesPIdD:
//             json["/wp/v2/blocks/(?P<parent>[\\d]+)/autosaves/(?P<id>[\\d]+)"] ==
//                     null
//                 ? null
//                 : WpV2BlocksPParentDAutosavesPIdDClass.fromMap(json[
//                     "/wp/v2/blocks/(?P<parent>[\\d]+)/autosaves/(?P<id>[\\d]+)"]),
//         wpV2Templates: json["/wp/v2/templates"] == null
//             ? null
//             : WpV2Templates.fromMap(json["/wp/v2/templates"]),
//         wpV2TemplatesPIdW: json["/wp/v2/templates/(?P<id>[\\/\\w-]+)"] == null
//             ? null
//             : WpV2TemplatesPId.fromMap(
//                 json["/wp/v2/templates/(?P<id>[\\/\\w-]+)"]),
//         wpV2TemplatesPParentDRevisions:
//             json["/wp/v2/templates/(?P<parent>[\\d]+)/revisions"] == null
//                 ? null
//                 : WpV2SPParentDRevisions.fromMap(
//                     json["/wp/v2/templates/(?P<parent>[\\d]+)/revisions"]),
//         wpV2TemplatesPParentDRevisionsPIdD: json[
//                     "/wp/v2/templates/(?P<parent>[\\d]+)/revisions/(?P<id>[\\d]+)"] ==
//                 null
//             ? null
//             : WpV2BlocksPParentDAutosavesPIdDClass.fromMap(json[
//                 "/wp/v2/templates/(?P<parent>[\\d]+)/revisions/(?P<id>[\\d]+)"]),
//         wpV2TemplatesPIdDAutosaves:
//             json["/wp/v2/templates/(?P<id>[\\d]+)/autosaves"] == null
//                 ? null
//                 : WpV2TemplatesPId.fromMap(
//                     json["/wp/v2/templates/(?P<id>[\\d]+)/autosaves"]),
//         wpV2TemplatesPParentDAutosavesPIdD: json[
//                     "/wp/v2/templates/(?P<parent>[\\d]+)/autosaves/(?P<id>[\\d]+)"] ==
//                 null
//             ? null
//             : WpV2BlocksPParentDAutosavesPIdDClass.fromMap(json[
//                 "/wp/v2/templates/(?P<parent>[\\d]+)/autosaves/(?P<id>[\\d]+)"]),
//         wpV2Types: json["/wp/v2/types"] == null
//             ? null
//             : WpV2SidebarsClass.fromMap(json["/wp/v2/types"]),
//         wpV2TypesPTypeW: json["/wp/v2/types/(?P<type>[\\w-]+)"] == null
//             ? null
//             : WpV2T.fromMap(json["/wp/v2/types/(?P<type>[\\w-]+)"]),
//         wpV2Statuses: json["/wp/v2/statuses"] == null
//             ? null
//             : WpV2SidebarsClass.fromMap(json["/wp/v2/statuses"]),
//         wpV2StatusesPStatusW:
//             json["/wp/v2/statuses/(?P<status>[\\w-]+)"] == null
//                 ? null
//                 : WpV2StatusesPStatusW.fromMap(
//                     json["/wp/v2/statuses/(?P<status>[\\w-]+)"]),
//         wpV2Taxonomies: json["/wp/v2/taxonomies"] == null
//             ? null
//             : WpV2T.fromMap(json["/wp/v2/taxonomies"]),
//         wpV2TaxonomiesPTaxonomyW:
//             json["/wp/v2/taxonomies/(?P<taxonomy>[\\w-]+)"] == null
//                 ? null
//                 : WpV2TaxonomiesPTaxonomyW.fromMap(
//                     json["/wp/v2/taxonomies/(?P<taxonomy>[\\w-]+)"]),
//         wpV2Categories: json["/wp/v2/categories"] == null
//             ? null
//             : WpV2CategoriesClass.fromMap(json["/wp/v2/categories"]),
//         wpV2CategoriesPIdD: json["/wp/v2/categories/(?P<id>[\\d]+)"] == null
//             ? null
//             : WpV2CategoriesPIdDClass.fromMap(
//                 json["/wp/v2/categories/(?P<id>[\\d]+)"]),
//         wpV2Tags: json["/wp/v2/tags"] == null
//             ? null
//             : WpV2CategoriesClass.fromMap(json["/wp/v2/tags"]),
//         wpV2TagsPIdD: json["/wp/v2/tags/(?P<id>[\\d]+)"] == null
//             ? null
//             : WpV2CategoriesPIdDClass.fromMap(
//                 json["/wp/v2/tags/(?P<id>[\\d]+)"]),
//         wpV2Users: json["/wp/v2/users"] == null
//             ? null
//             : WpV2Users.fromMap(json["/wp/v2/users"]),
//         wpV2UsersPIdD: json["/wp/v2/users/(?P<id>[\\d]+)"] == null
//             ? null
//             : WpV2UsersPIdD.fromMap(json["/wp/v2/users/(?P<id>[\\d]+)"]),
//         wpV2UsersMe: json["/wp/v2/users/me"] == null
//             ? null
//             : WpV2UsersMe.fromMap(json["/wp/v2/users/me"]),
//         wpV2UsersPUserIdDMeApplicationPasswords: json[
//                     "/wp/v2/users/(?P<user_id>(?:[\\d]+|me))/application-passwords"] ==
//                 null
//             ? null
//             : WpV2UsersPUserIdDMeApplicationPasswords.fromMap(json[
//                 "/wp/v2/users/(?P<user_id>(?:[\\d]+|me))/application-passwords"]),
//         wpV2UsersPUserIdDMeApplicationPasswordsIntrospect: json[
//                     "/wp/v2/users/(?P<user_id>(?:[\\d]+|me))/application-passwords/introspect"] ==
//                 null
//             ? null
//             : WpV2SidebarsClass.fromMap(json[
//                 "/wp/v2/users/(?P<user_id>(?:[\\d]+|me))/application-passwords/introspect"]),
//         wpV2UsersPUserIdDMeApplicationPasswordsPUuidW: json[
//                     "/wp/v2/users/(?P<user_id>(?:[\\d]+|me))/application-passwords/(?P<uuid>[\\w\\-]+)"] ==
//                 null
//             ? null
//             : WpV2UsersPUserIdDMeApplicationPasswords.fromMap(json[
//                 "/wp/v2/users/(?P<user_id>(?:[\\d]+|me))/application-passwords/(?P<uuid>[\\w\\-]+)"]),
//         wpV2Comments: json["/wp/v2/comments"] == null
//             ? null
//             : WpV2Comments.fromMap(json["/wp/v2/comments"]),
//         wpV2CommentsPIdD: json["/wp/v2/comments/(?P<id>[\\d]+)"] == null
//             ? null
//             : WpV2CommentsPIdD.fromMap(json["/wp/v2/comments/(?P<id>[\\d]+)"]),
//         wpV2Search: json["/wp/v2/search"] == null
//             ? null
//             : WpV2Search.fromMap(json["/wp/v2/search"]),
//         wpV2BlockRendererPNameAZ09AZ09: json[
//                     "/wp/v2/block-renderer/(?P<name>[a-z0-9-]+/[a-z0-9-]+)"] ==
//                 null
//             ? null
//             : WpV2BlockRendererPNameAZ09AZ09.fromMap(
//                 json["/wp/v2/block-renderer/(?P<name>[a-z0-9-]+/[a-z0-9-]+)"]),
//         wpV2BlockTypes: json["/wp/v2/block-types"] == null
//             ? null
//             : WpV2BlockTypes.fromMap(json["/wp/v2/block-types"]),
//         wpV2BlockTypesPNamespaceAZAZ09:
//             json["/wp/v2/block-types/(?P<namespace>[a-zA-Z0-9_-]+)"] == null
//                 ? null
//                 : WpV2BlockTypes.fromMap(
//                     json["/wp/v2/block-types/(?P<namespace>[a-zA-Z0-9_-]+)"]),
//         wpV2BlockTypesPNamespaceAZAZ09PNameAZAZ09: json[
//                     "/wp/v2/block-types/(?P<namespace>[a-zA-Z0-9_-]+)/(?P<name>[a-zA-Z0-9_-]+)"] ==
//                 null
//             ? null
//             : WpV2BlockTypesPNamespaceAZAZ09PNameAZAZ09.fromMap(json[
//                 "/wp/v2/block-types/(?P<namespace>[a-zA-Z0-9_-]+)/(?P<name>[a-zA-Z0-9_-]+)"]),
//         wpV2Settings: json["/wp/v2/settings"] == null
//             ? null
//             : WpV2Settings.fromMap(json["/wp/v2/settings"]),
//         wpV2Themes: json["/wp/v2/themes"] == null
//             ? null
//             : WpV2Themes.fromMap(json["/wp/v2/themes"]),
//         wpV2ThemesPStylesheetW:
//             json["/wp/v2/themes/(?P<stylesheet>[\\w-]+)"] == null
//                 ? null
//                 : WpV2ThemesPStylesheetW.fromMap(
//                     json["/wp/v2/themes/(?P<stylesheet>[\\w-]+)"]),
//         wpV2Plugins: json["/wp/v2/plugins"] == null
//             ? null
//             : WpV2Plugins.fromMap(json["/wp/v2/plugins"]),
//         wpV2PluginsPPlugin: json[
//                     "/wp/v2/plugins/(?P<plugin>[^.\\/]+(?:\\/[^.\\/]+)?)"] ==
//                 null
//             ? null
//             : WpV2PluginsPPlugin.fromMap(
//                 json["/wp/v2/plugins/(?P<plugin>[^.\\/]+(?:\\/[^.\\/]+)?)"]),
//         wpV2Sidebars: json["/wp/v2/sidebars"] == null
//             ? null
//             : WpV2SidebarsClass.fromMap(json["/wp/v2/sidebars"]),
//         wpV2SidebarsPIdW: json["/wp/v2/sidebars/(?P<id>[\\w-]+)"] == null
//             ? null
//             : WpV2SidebarsPIdW.fromMap(json["/wp/v2/sidebars/(?P<id>[\\w-]+)"]),
//         wpV2WidgetTypes: json["/wp/v2/widget-types"] == null
//             ? null
//             : WpV2SidebarsClass.fromMap(json["/wp/v2/widget-types"]),
//         wpV2WidgetTypesPIdAZAZ09:
//             json["/wp/v2/widget-types/(?P<id>[a-zA-Z0-9_-]+)"] == null
//                 ? null
//                 : WpV2WidgetTypesPIdAZAZ09.fromMap(
//                     json["/wp/v2/widget-types/(?P<id>[a-zA-Z0-9_-]+)"]),
//         wpV2WidgetTypesPIdAZAZ09Encode:
//             json["/wp/v2/widget-types/(?P<id>[a-zA-Z0-9_-]+)/encode"] == null
//                 ? null
//                 : WpV2WidgetTypesPIdAZAZ09Encode.fromMap(
//                     json["/wp/v2/widget-types/(?P<id>[a-zA-Z0-9_-]+)/encode"]),
//         wpV2Widgets: json["/wp/v2/widgets"] == null
//             ? null
//             : WpV2Widgets.fromMap(json["/wp/v2/widgets"]),
//         wpV2WidgetsPIdW: json["/wp/v2/widgets/(?P<id>[\\w\\-]+)"] == null
//             ? null
//             : WpV2WidgetsPIdW.fromMap(json["/wp/v2/widgets/(?P<id>[\\w\\-]+)"]),
//         wpV2BlockDirectorySearch: json["/wp/v2/block-directory/search"] == null
//             ? null
//             : WpV2BlockDirectorySearch.fromMap(
//                 json["/wp/v2/block-directory/search"]),
//         wpV2PatternDirectoryPatterns:
//             json["/wp/v2/pattern-directory/patterns"] == null
//                 ? null
//                 : WpV2PatternDirectoryPatterns.fromMap(
//                     json["/wp/v2/pattern-directory/patterns"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "/wp/v2": wpV2 == null ? null : wpV2.toMap(),
//         "/wp/v2/posts": wpV2Posts == null ? null : wpV2Posts.toMap(),
//         "/wp/v2/posts/(?P<id>[\\d]+)":
//             wpV2PostsPIdD == null ? null : wpV2PostsPIdD.toMap(),
//         "/wp/v2/posts/(?P<parent>[\\d]+)/revisions":
//             wpV2PostsPParentDRevisions == null
//                 ? null
//                 : wpV2PostsPParentDRevisions.toMap(),
//         "/wp/v2/posts/(?P<parent>[\\d]+)/revisions/(?P<id>[\\d]+)":
//             wpV2PostsPParentDRevisionsPIdD == null
//                 ? null
//                 : wpV2PostsPParentDRevisionsPIdD.toMap(),
//         "/wp/v2/posts/(?P<id>[\\d]+)/autosaves": wpV2PostsPIdDAutosaves == null
//             ? null
//             : wpV2PostsPIdDAutosaves.toMap(),
//         "/wp/v2/posts/(?P<parent>[\\d]+)/autosaves/(?P<id>[\\d]+)":
//             wpV2PostsPParentDAutosavesPIdD == null
//                 ? null
//                 : wpV2PostsPParentDAutosavesPIdD.toMap(),
//         "/wp/v2/pages": wpV2Pages == null ? null : wpV2Pages.toMap(),
//         "/wp/v2/pages/(?P<id>[\\d]+)":
//             wpV2PagesPIdD == null ? null : wpV2PagesPIdD.toMap(),
//         "/wp/v2/pages/(?P<parent>[\\d]+)/revisions":
//             wpV2PagesPParentDRevisions == null
//                 ? null
//                 : wpV2PagesPParentDRevisions.toMap(),
//         "/wp/v2/pages/(?P<parent>[\\d]+)/revisions/(?P<id>[\\d]+)":
//             wpV2PagesPParentDRevisionsPIdD == null
//                 ? null
//                 : wpV2PagesPParentDRevisionsPIdD.toMap(),
//         "/wp/v2/pages/(?P<id>[\\d]+)/autosaves": wpV2PagesPIdDAutosaves == null
//             ? null
//             : wpV2PagesPIdDAutosaves.toMap(),
//         "/wp/v2/pages/(?P<parent>[\\d]+)/autosaves/(?P<id>[\\d]+)":
//             wpV2PagesPParentDAutosavesPIdD == null
//                 ? null
//                 : wpV2PagesPParentDAutosavesPIdD.toMap(),
//         "/wp/v2/media": wpV2Media == null ? null : wpV2Media.toMap(),
//         "/wp/v2/media/(?P<id>[\\d]+)":
//             wpV2MediaPIdD == null ? null : wpV2MediaPIdD.toMap(),
//         "/wp/v2/media/(?P<id>[\\d]+)/post-process":
//             wpV2MediaPIdDPostProcess == null
//                 ? null
//                 : wpV2MediaPIdDPostProcess.toMap(),
//         "/wp/v2/media/(?P<id>[\\d]+)/edit":
//             wpV2MediaPIdDEdit == null ? null : wpV2MediaPIdDEdit.toMap(),
//         "/wp/v2/blocks": wpV2Blocks == null ? null : wpV2Blocks.toMap(),
//         "/wp/v2/blocks/(?P<id>[\\d]+)":
//             wpV2BlocksPIdD == null ? null : wpV2BlocksPIdD.toMap(),
//         "/wp/v2/blocks/(?P<parent>[\\d]+)/revisions":
//             wpV2BlocksPParentDRevisions == null
//                 ? null
//                 : wpV2BlocksPParentDRevisions.toMap(),
//         "/wp/v2/blocks/(?P<parent>[\\d]+)/revisions/(?P<id>[\\d]+)":
//             wpV2BlocksPParentDRevisionsPIdD == null
//                 ? null
//                 : wpV2BlocksPParentDRevisionsPIdD.toMap(),
//         "/wp/v2/blocks/(?P<id>[\\d]+)/autosaves":
//             wpV2BlocksPIdDAutosaves == null
//                 ? null
//                 : wpV2BlocksPIdDAutosaves.toMap(),
//         "/wp/v2/blocks/(?P<parent>[\\d]+)/autosaves/(?P<id>[\\d]+)":
//             wpV2BlocksPParentDAutosavesPIdD == null
//                 ? null
//                 : wpV2BlocksPParentDAutosavesPIdD.toMap(),
//         "/wp/v2/templates":
//             wpV2Templates == null ? null : wpV2Templates.toMap(),
//         "/wp/v2/templates/(?P<id>[\\/\\w-]+)":
//             wpV2TemplatesPIdW == null ? null : wpV2TemplatesPIdW.toMap(),
//         "/wp/v2/templates/(?P<parent>[\\d]+)/revisions":
//             wpV2TemplatesPParentDRevisions == null
//                 ? null
//                 : wpV2TemplatesPParentDRevisions.toMap(),
//         "/wp/v2/templates/(?P<parent>[\\d]+)/revisions/(?P<id>[\\d]+)":
//             wpV2TemplatesPParentDRevisionsPIdD == null
//                 ? null
//                 : wpV2TemplatesPParentDRevisionsPIdD.toMap(),
//         "/wp/v2/templates/(?P<id>[\\d]+)/autosaves":
//             wpV2TemplatesPIdDAutosaves == null
//                 ? null
//                 : wpV2TemplatesPIdDAutosaves.toMap(),
//         "/wp/v2/templates/(?P<parent>[\\d]+)/autosaves/(?P<id>[\\d]+)":
//             wpV2TemplatesPParentDAutosavesPIdD == null
//                 ? null
//                 : wpV2TemplatesPParentDAutosavesPIdD.toMap(),
//         "/wp/v2/types": wpV2Types == null ? null : wpV2Types.toMap(),
//         "/wp/v2/types/(?P<type>[\\w-]+)":
//             wpV2TypesPTypeW == null ? null : wpV2TypesPTypeW.toMap(),
//         "/wp/v2/statuses": wpV2Statuses == null ? null : wpV2Statuses.toMap(),
//         "/wp/v2/statuses/(?P<status>[\\w-]+)":
//             wpV2StatusesPStatusW == null ? null : wpV2StatusesPStatusW.toMap(),
//         "/wp/v2/taxonomies":
//             wpV2Taxonomies == null ? null : wpV2Taxonomies.toMap(),
//         "/wp/v2/taxonomies/(?P<taxonomy>[\\w-]+)":
//             wpV2TaxonomiesPTaxonomyW == null
//                 ? null
//                 : wpV2TaxonomiesPTaxonomyW.toMap(),
//         "/wp/v2/categories":
//             wpV2Categories == null ? null : wpV2Categories.toMap(),
//         "/wp/v2/categories/(?P<id>[\\d]+)":
//             wpV2CategoriesPIdD == null ? null : wpV2CategoriesPIdD.toMap(),
//         "/wp/v2/tags": wpV2Tags == null ? null : wpV2Tags.toMap(),
//         "/wp/v2/tags/(?P<id>[\\d]+)":
//             wpV2TagsPIdD == null ? null : wpV2TagsPIdD.toMap(),
//         "/wp/v2/users": wpV2Users == null ? null : wpV2Users.toMap(),
//         "/wp/v2/users/(?P<id>[\\d]+)":
//             wpV2UsersPIdD == null ? null : wpV2UsersPIdD.toMap(),
//         "/wp/v2/users/me": wpV2UsersMe == null ? null : wpV2UsersMe.toMap(),
//         "/wp/v2/users/(?P<user_id>(?:[\\d]+|me))/application-passwords":
//             wpV2UsersPUserIdDMeApplicationPasswords == null
//                 ? null
//                 : wpV2UsersPUserIdDMeApplicationPasswords.toMap(),
//         "/wp/v2/users/(?P<user_id>(?:[\\d]+|me))/application-passwords/introspect":
//             wpV2UsersPUserIdDMeApplicationPasswordsIntrospect == null
//                 ? null
//                 : wpV2UsersPUserIdDMeApplicationPasswordsIntrospect.toMap(),
//         "/wp/v2/users/(?P<user_id>(?:[\\d]+|me))/application-passwords/(?P<uuid>[\\w\\-]+)":
//             wpV2UsersPUserIdDMeApplicationPasswordsPUuidW == null
//                 ? null
//                 : wpV2UsersPUserIdDMeApplicationPasswordsPUuidW.toMap(),
//         "/wp/v2/comments": wpV2Comments == null ? null : wpV2Comments.toMap(),
//         "/wp/v2/comments/(?P<id>[\\d]+)":
//             wpV2CommentsPIdD == null ? null : wpV2CommentsPIdD.toMap(),
//         "/wp/v2/search": wpV2Search == null ? null : wpV2Search.toMap(),
//         "/wp/v2/block-renderer/(?P<name>[a-z0-9-]+/[a-z0-9-]+)":
//             wpV2BlockRendererPNameAZ09AZ09 == null
//                 ? null
//                 : wpV2BlockRendererPNameAZ09AZ09.toMap(),
//         "/wp/v2/block-types":
//             wpV2BlockTypes == null ? null : wpV2BlockTypes.toMap(),
//         "/wp/v2/block-types/(?P<namespace>[a-zA-Z0-9_-]+)":
//             wpV2BlockTypesPNamespaceAZAZ09 == null
//                 ? null
//                 : wpV2BlockTypesPNamespaceAZAZ09.toMap(),
//         "/wp/v2/block-types/(?P<namespace>[a-zA-Z0-9_-]+)/(?P<name>[a-zA-Z0-9_-]+)":
//             wpV2BlockTypesPNamespaceAZAZ09PNameAZAZ09 == null
//                 ? null
//                 : wpV2BlockTypesPNamespaceAZAZ09PNameAZAZ09.toMap(),
//         "/wp/v2/settings": wpV2Settings == null ? null : wpV2Settings.toMap(),
//         "/wp/v2/themes": wpV2Themes == null ? null : wpV2Themes.toMap(),
//         "/wp/v2/themes/(?P<stylesheet>[\\w-]+)": wpV2ThemesPStylesheetW == null
//             ? null
//             : wpV2ThemesPStylesheetW.toMap(),
//         "/wp/v2/plugins": wpV2Plugins == null ? null : wpV2Plugins.toMap(),
//         "/wp/v2/plugins/(?P<plugin>[^.\\/]+(?:\\/[^.\\/]+)?)":
//             wpV2PluginsPPlugin == null ? null : wpV2PluginsPPlugin.toMap(),
//         "/wp/v2/sidebars": wpV2Sidebars == null ? null : wpV2Sidebars.toMap(),
//         "/wp/v2/sidebars/(?P<id>[\\w-]+)":
//             wpV2SidebarsPIdW == null ? null : wpV2SidebarsPIdW.toMap(),
//         "/wp/v2/widget-types":
//             wpV2WidgetTypes == null ? null : wpV2WidgetTypes.toMap(),
//         "/wp/v2/widget-types/(?P<id>[a-zA-Z0-9_-]+)":
//             wpV2WidgetTypesPIdAZAZ09 == null
//                 ? null
//                 : wpV2WidgetTypesPIdAZAZ09.toMap(),
//         "/wp/v2/widget-types/(?P<id>[a-zA-Z0-9_-]+)/encode":
//             wpV2WidgetTypesPIdAZAZ09Encode == null
//                 ? null
//                 : wpV2WidgetTypesPIdAZAZ09Encode.toMap(),
//         "/wp/v2/widgets": wpV2Widgets == null ? null : wpV2Widgets.toMap(),
//         "/wp/v2/widgets/(?P<id>[\\w\\-]+)":
//             wpV2WidgetsPIdW == null ? null : wpV2WidgetsPIdW.toMap(),
//         "/wp/v2/block-directory/search": wpV2BlockDirectorySearch == null
//             ? null
//             : wpV2BlockDirectorySearch.toMap(),
//         "/wp/v2/pattern-directory/patterns":
//             wpV2PatternDirectoryPatterns == null
//                 ? null
//                 : wpV2PatternDirectoryPatterns.toMap(),
//       };
// }

// class WpV2 {
//   WpV2({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//     this.links,
//   });

//   final String namespace;
//   final List<Method> methods;
//   final List<WpV2Endpoint> endpoints;
//   final WpV2Links links;

//   factory WpV2.fromMap(Map<String, dynamic> json) => WpV2(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2Endpoint>.from(
//                 json["endpoints"].map((x) => WpV2Endpoint.fromMap(x))),
//         links:
//             json["_links"] == null ? null : WpV2Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//         "_links": links == null ? null : links.toMap(),
//       };
// }

// class WpV2Endpoint {
//   WpV2Endpoint({
//     this.methods,
//     this.args,
//   });

//   final List<Method> methods;
//   final PurpleArgs args;

//   factory WpV2Endpoint.fromMap(Map<String, dynamic> json) => WpV2Endpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         args: json["args"] == null ? null : PurpleArgs.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class PurpleArgs {
//   PurpleArgs({
//     this.namespace,
//     this.context,
//   });

//   final NamespaceClass namespace;
//   final NamespaceClass context;

//   factory PurpleArgs.fromMap(Map<String, dynamic> json) => PurpleArgs(
//         namespace: json["namespace"] == null
//             ? null
//             : NamespaceClass.fromMap(json["namespace"]),
//         context: json["context"] == null
//             ? null
//             : NamespaceClass.fromMap(json["context"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace.toMap(),
//         "context": context == null ? null : context.toMap(),
//       };
// }

// class NamespaceClass {
//   NamespaceClass({
//     this.contextDefault,
//     this.required,
//   });

//   final String contextDefault;
//   final bool required;

//   factory NamespaceClass.fromMap(Map<String, dynamic> json) => NamespaceClass(
//         contextDefault: json["default"] == null ? null : json["default"],
//         required: json["required"] == null ? null : json["required"],
//       );

//   Map<String, dynamic> toMap() => {
//         "default": contextDefault == null ? null : contextDefault,
//         "required": required == null ? null : required,
//       };
// }

// enum Method { GET, DELETE }

// final methodValues = EnumValues({"DELETE": Method.DELETE, "GET": Method.GET});

// class WpV2Links {
//   WpV2Links({
//     this.self,
//   });

//   final List<Up> self;

//   factory WpV2Links.fromMap(Map<String, dynamic> json) => WpV2Links(
//         self: json["self"] == null
//             ? null
//             : List<Up>.from(json["self"].map((x) => Up.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "self": self == null
//             ? null
//             : List<dynamic>.from(self.map((x) => x.toMap())),
//       };
// }

// class WpV2BlockDirectorySearch {
//   WpV2BlockDirectorySearch({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//     this.links,
//   });

//   final String namespace;
//   final List<Method> methods;
//   final List<WpV2BlockDirectorySearchEndpoint> endpoints;
//   final WpV2Links links;

//   factory WpV2BlockDirectorySearch.fromMap(Map<String, dynamic> json) =>
//       WpV2BlockDirectorySearch(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2BlockDirectorySearchEndpoint>.from(json["endpoints"]
//                 .map((x) => WpV2BlockDirectorySearchEndpoint.fromMap(x))),
//         links:
//             json["_links"] == null ? null : WpV2Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//         "_links": links == null ? null : links.toMap(),
//       };
// }

// class WpV2BlockDirectorySearchEndpoint {
//   WpV2BlockDirectorySearchEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<Method> methods;
//   final FluffyArgs args;

//   factory WpV2BlockDirectorySearchEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2BlockDirectorySearchEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         args: json["args"] == null ? null : FluffyArgs.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class FluffyArgs {
//   FluffyArgs({
//     this.context,
//     this.page,
//     this.perPage,
//     this.term,
//   });

//   final StatusClass context;
//   final SrcValue page;
//   final SrcValue perPage;
//   final TermValue term;

//   factory FluffyArgs.fromMap(Map<String, dynamic> json) => FluffyArgs(
//         context: json["context"] == null
//             ? null
//             : StatusClass.fromMap(json["context"]),
//         page: json["page"] == null ? null : SrcValue.fromMap(json["page"]),
//         perPage: json["per_page"] == null
//             ? null
//             : SrcValue.fromMap(json["per_page"]),
//         term: json["term"] == null ? null : TermValue.fromMap(json["term"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "context": context == null ? null : context.toMap(),
//         "page": page == null ? null : page.toMap(),
//         "per_page": perPage == null ? null : perPage.toMap(),
//         "term": term == null ? null : term.toMap(),
//       };
// }

// class StatusClass {
//   StatusClass({
//     this.description,
//     this.type,
//     this.contextEnum,
//     this.contextDefault,
//     this.required,
//     this.items,
//     this.format,
//     this.properties,
//     this.minimum,
//     this.maximum,
//   });

//   final String description;
//   final TypeElement type;
//   final List<String> contextEnum;
//   final dynamic contextDefault;
//   final bool required;
//   final AuthorEmailItems items;
//   final Format format;
//   final dynamic properties;
//   final int minimum;
//   final int maximum;

//   factory StatusClass.fromMap(Map<String, dynamic> json) => StatusClass(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         contextEnum: json["enum"] == null
//             ? null
//             : List<String>.from(json["enum"].map((x) => x)),
//         contextDefault: json["default"],
//         required: json["required"] == null ? null : json["required"],
//         items: json["items"] == null
//             ? null
//             : AuthorEmailItems.fromMap(json["items"]),
//         format:
//             json["format"] == null ? null : formatValues.map[json["format"]],
//         properties: json["properties"],
//         minimum: json["minimum"] == null ? null : json["minimum"],
//         maximum: json["maximum"] == null ? null : json["maximum"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "enum": contextEnum == null
//             ? null
//             : List<dynamic>.from(contextEnum.map((x) => x)),
//         "default": contextDefault,
//         "required": required == null ? null : required,
//         "items": items == null ? null : items.toMap(),
//         "format": format == null ? null : formatValues.reverse[format],
//         "properties": properties,
//         "minimum": minimum == null ? null : minimum,
//         "maximum": maximum == null ? null : maximum,
//       };
// }

// enum Format { DATE_TIME, IP, URI, EMAIL, UUID }

// final formatValues = EnumValues({
//   "date-time": Format.DATE_TIME,
//   "email": Format.EMAIL,
//   "ip": Format.IP,
//   "uri": Format.URI,
//   "uuid": Format.UUID
// });

// class AuthorEmailItems {
//   AuthorEmailItems({
//     this.itemsEnum,
//     this.type,
//   });

//   final List<String> itemsEnum;
//   final dynamic type;

//   factory AuthorEmailItems.fromMap(Map<String, dynamic> json) =>
//       AuthorEmailItems(
//         itemsEnum: json["enum"] == null
//             ? null
//             : List<String>.from(json["enum"].map((x) => x)),
//         type: json["type"],
//       );

//   Map<String, dynamic> toMap() => {
//         "enum": itemsEnum == null
//             ? null
//             : List<dynamic>.from(itemsEnum.map((x) => x)),
//         "type": type,
//       };
// }

// enum TypeElement { STRING, INTEGER, BOOLEAN, OBJECT, ARRAY, NUMBER, NULL }

// final typeElementValues = EnumValues({
//   "array": TypeElement.ARRAY,
//   "boolean": TypeElement.BOOLEAN,
//   "integer": TypeElement.INTEGER,
//   "null": TypeElement.NULL,
//   "number": TypeElement.NUMBER,
//   "object": TypeElement.OBJECT,
//   "string": TypeElement.STRING
// });

// class PurpleProperties {
//   PurpleProperties({
//     this.raw,
//     this.rendered,
//     this.blockVersion,
//     this.protected,
//     this.encoded,
//     this.hash,
//   });

//   final BlockVersion raw;
//   final BlockVersion rendered;
//   final BlockVersion blockVersion;
//   final BlockVersion protected;
//   final BlockVersion encoded;
//   final BlockVersion hash;

//   factory PurpleProperties.fromMap(Map<String, dynamic> json) =>
//       PurpleProperties(
//         raw: json["raw"] == null ? null : BlockVersion.fromMap(json["raw"]),
//         rendered: json["rendered"] == null
//             ? null
//             : BlockVersion.fromMap(json["rendered"]),
//         blockVersion: json["block_version"] == null
//             ? null
//             : BlockVersion.fromMap(json["block_version"]),
//         protected: json["protected"] == null
//             ? null
//             : BlockVersion.fromMap(json["protected"]),
//         encoded: json["encoded"] == null
//             ? null
//             : BlockVersion.fromMap(json["encoded"]),
//         hash: json["hash"] == null ? null : BlockVersion.fromMap(json["hash"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "raw": raw == null ? null : raw.toMap(),
//         "rendered": rendered == null ? null : rendered.toMap(),
//         "block_version": blockVersion == null ? null : blockVersion.toMap(),
//         "protected": protected == null ? null : protected.toMap(),
//         "encoded": encoded == null ? null : encoded.toMap(),
//         "hash": hash == null ? null : hash.toMap(),
//       };
// }

// class BlockVersion {
//   BlockVersion({
//     this.description,
//     this.type,
//     this.context,
//     this.readonly,
//   });

//   final String description;
//   final TypeElement type;
//   final List<ContextElement> context;
//   final bool readonly;

//   factory BlockVersion.fromMap(Map<String, dynamic> json) => BlockVersion(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         context: json["context"] == null
//             ? null
//             : List<ContextElement>.from(
//                 json["context"].map((x) => contextElementValues.map[x])),
//         readonly: json["readonly"] == null ? null : json["readonly"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "context": context == null
//             ? null
//             : List<dynamic>.from(
//                 context.map((x) => contextElementValues.reverse[x])),
//         "readonly": readonly == null ? null : readonly,
//       };
// }

// enum ContextElement { EDIT, VIEW, EMBED }

// final contextElementValues = EnumValues({
//   "edit": ContextElement.EDIT,
//   "embed": ContextElement.EMBED,
//   "view": ContextElement.VIEW
// });

// class SrcValue {
//   SrcValue({
//     this.description,
//     this.type,
//     this.argDefault,
//     this.minimum,
//     this.required,
//     this.maximum,
//     this.items,
//     this.argEnum,
//     this.properties,
//     this.format,
//     this.pattern,
//     this.minLength,
//   });

//   final String description;
//   final TypeElement type;
//   final dynamic argDefault;
//   final int minimum;
//   final bool required;
//   final int maximum;
//   final ArgItems items;
//   final List<String> argEnum;
//   final dynamic properties;
//   final Format format;
//   final String pattern;
//   final int minLength;

//   factory SrcValue.fromMap(Map<String, dynamic> json) => SrcValue(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         argDefault: json["default"],
//         minimum: json["minimum"] == null ? null : json["minimum"],
//         required: json["required"] == null ? null : json["required"],
//         maximum: json["maximum"] == null ? null : json["maximum"],
//         items: json["items"] == null ? null : ArgItems.fromMap(json["items"]),
//         argEnum: json["enum"] == null
//             ? null
//             : List<String>.from(json["enum"].map((x) => x)),
//         properties: json["properties"],
//         format:
//             json["format"] == null ? null : formatValues.map[json["format"]],
//         pattern: json["pattern"] == null ? null : json["pattern"],
//         minLength: json["minLength"] == null ? null : json["minLength"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "default": argDefault,
//         "minimum": minimum == null ? null : minimum,
//         "required": required == null ? null : required,
//         "maximum": maximum == null ? null : maximum,
//         "items": items == null ? null : items.toMap(),
//         "enum":
//             argEnum == null ? null : List<dynamic>.from(argEnum.map((x) => x)),
//         "properties": properties,
//         "format": format == null ? null : formatValues.reverse[format],
//         "pattern": pattern == null ? null : pattern,
//         "minLength": minLength == null ? null : minLength,
//       };
// }

// enum DefaultEnum { VIEW, INACTIVE, DESC, DATE, ASC, NAME }

// final defaultEnumValues = EnumValues({
//   "asc": DefaultEnum.ASC,
//   "date": DefaultEnum.DATE,
//   "desc": DefaultEnum.DESC,
//   "inactive": DefaultEnum.INACTIVE,
//   "name": DefaultEnum.NAME,
//   "view": DefaultEnum.VIEW
// });

// class ArgItems {
//   ArgItems({
//     this.type,
//     this.itemsEnum,
//   });

//   final TypeElement type;
//   final List<String> itemsEnum;

//   factory ArgItems.fromMap(Map<String, dynamic> json) => ArgItems(
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         itemsEnum: json["enum"] == null
//             ? null
//             : List<String>.from(json["enum"].map((x) => x)),
//       );

//   Map<String, dynamic> toMap() => {
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "enum": itemsEnum == null
//             ? null
//             : List<dynamic>.from(itemsEnum.map((x) => x)),
//       };
// }

// class TermValue {
//   TermValue({
//     this.description,
//     this.type,
//     this.minLength,
//     this.required,
//     this.argDefault,
//     this.format,
//     this.properties,
//     this.items,
//     this.argEnum,
//     this.minimum,
//     this.maximum,
//     this.pattern,
//   });

//   final String description;
//   final TypeElement type;
//   final int minLength;
//   final bool required;
//   final dynamic argDefault;
//   final Format format;
//   final dynamic properties;
//   final ArgItems items;
//   final List<String> argEnum;
//   final int minimum;
//   final int maximum;
//   final String pattern;

//   factory TermValue.fromMap(Map<String, dynamic> json) => TermValue(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         minLength: json["minLength"] == null ? null : json["minLength"],
//         required: json["required"] == null ? null : json["required"],
//         argDefault: json["default"],
//         format:
//             json["format"] == null ? null : formatValues.map[json["format"]],
//         properties: json["properties"],
//         items: json["items"] == null ? null : ArgItems.fromMap(json["items"]),
//         argEnum: json["enum"] == null
//             ? null
//             : List<String>.from(json["enum"].map((x) => x)),
//         minimum: json["minimum"] == null ? null : json["minimum"],
//         maximum: json["maximum"] == null ? null : json["maximum"],
//         pattern: json["pattern"] == null ? null : json["pattern"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "minLength": minLength == null ? null : minLength,
//         "required": required == null ? null : required,
//         "default": argDefault,
//         "format": format == null ? null : formatValues.reverse[format],
//         "properties": properties,
//         "items": items == null ? null : items.toMap(),
//         "enum":
//             argEnum == null ? null : List<dynamic>.from(argEnum.map((x) => x)),
//         "minimum": minimum == null ? null : minimum,
//         "maximum": maximum == null ? null : maximum,
//         "pattern": pattern == null ? null : pattern,
//       };
// }

// class ContentPropertiesClass {
//   ContentPropertiesClass({
//     this.raw,
//     this.blockVersion,
//     this.protected,
//     this.rendered,
//   });

//   final BlockVersion raw;
//   final BlockVersion blockVersion;
//   final BlockVersion protected;
//   final BlockVersion rendered;

//   factory ContentPropertiesClass.fromMap(Map<String, dynamic> json) =>
//       ContentPropertiesClass(
//         raw: json["raw"] == null ? null : BlockVersion.fromMap(json["raw"]),
//         blockVersion: json["block_version"] == null
//             ? null
//             : BlockVersion.fromMap(json["block_version"]),
//         protected: json["protected"] == null
//             ? null
//             : BlockVersion.fromMap(json["protected"]),
//         rendered: json["rendered"] == null
//             ? null
//             : BlockVersion.fromMap(json["rendered"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "raw": raw == null ? null : raw.toMap(),
//         "block_version": blockVersion == null ? null : blockVersion.toMap(),
//         "protected": protected == null ? null : protected.toMap(),
//         "rendered": rendered == null ? null : rendered.toMap(),
//       };
// }

// class WpV2BlockRendererPNameAZ09AZ09 {
//   WpV2BlockRendererPNameAZ09AZ09({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2BlockRendererPNameAZ09AZ09Endpoint> endpoints;

//   factory WpV2BlockRendererPNameAZ09AZ09.fromMap(Map<String, dynamic> json) =>
//       WpV2BlockRendererPNameAZ09AZ09(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2BlockRendererPNameAZ09AZ09Endpoint>.from(
//                 json["endpoints"].map(
//                     (x) => WpV2BlockRendererPNameAZ09AZ09Endpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2BlockRendererPNameAZ09AZ09Endpoint {
//   WpV2BlockRendererPNameAZ09AZ09Endpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final TentacledArgs args;

//   factory WpV2BlockRendererPNameAZ09AZ09Endpoint.fromMap(
//           Map<String, dynamic> json) =>
//       WpV2BlockRendererPNameAZ09AZ09Endpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null ? null : TentacledArgs.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class TentacledArgs {
//   TentacledArgs({
//     this.name,
//     this.context,
//     this.attributes,
//     this.postId,
//   });

//   final TermValue name;
//   final StatusClass context;
//   final TermValue attributes;
//   final TermValue postId;

//   factory TentacledArgs.fromMap(Map<String, dynamic> json) => TentacledArgs(
//         name: json["name"] == null ? null : TermValue.fromMap(json["name"]),
//         context: json["context"] == null
//             ? null
//             : StatusClass.fromMap(json["context"]),
//         attributes: json["attributes"] == null
//             ? null
//             : TermValue.fromMap(json["attributes"]),
//         postId:
//             json["post_id"] == null ? null : TermValue.fromMap(json["post_id"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "name": name == null ? null : name.toMap(),
//         "context": context == null ? null : context.toMap(),
//         "attributes": attributes == null ? null : attributes.toMap(),
//         "post_id": postId == null ? null : postId.toMap(),
//       };
// }

// class WpV2BlockTypes {
//   WpV2BlockTypes({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//     this.links,
//   });

//   final String namespace;
//   final List<Method> methods;
//   final List<WpV2BlockTypesEndpoint> endpoints;
//   final WpV2Links links;

//   factory WpV2BlockTypes.fromMap(Map<String, dynamic> json) => WpV2BlockTypes(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2BlockTypesEndpoint>.from(json["endpoints"]
//                 .map((x) => WpV2BlockTypesEndpoint.fromMap(x))),
//         links:
//             json["_links"] == null ? null : WpV2Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//         "_links": links == null ? null : links.toMap(),
//       };
// }

// class WpV2BlockTypesEndpoint {
//   WpV2BlockTypesEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<Method> methods;
//   final StickyArgs args;

//   factory WpV2BlockTypesEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2BlockTypesEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         args: json["args"] == null ? null : StickyArgs.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class StickyArgs {
//   StickyArgs({
//     this.context,
//     this.namespace,
//   });

//   final StatusClass context;
//   final TermValue namespace;

//   factory StickyArgs.fromMap(Map<String, dynamic> json) => StickyArgs(
//         context: json["context"] == null
//             ? null
//             : StatusClass.fromMap(json["context"]),
//         namespace: json["namespace"] == null
//             ? null
//             : TermValue.fromMap(json["namespace"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "context": context == null ? null : context.toMap(),
//         "namespace": namespace == null ? null : namespace.toMap(),
//       };
// }

// class WpV2BlockTypesPNamespaceAZAZ09PNameAZAZ09 {
//   WpV2BlockTypesPNamespaceAZAZ09PNameAZAZ09({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<Method> methods;
//   final List<WpV2BlockTypesPNamespaceAZAZ09PNameAZAZ09Endpoint> endpoints;

//   factory WpV2BlockTypesPNamespaceAZAZ09PNameAZAZ09.fromMap(
//           Map<String, dynamic> json) =>
//       WpV2BlockTypesPNamespaceAZAZ09PNameAZAZ09(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2BlockTypesPNamespaceAZAZ09PNameAZAZ09Endpoint>.from(
//                 json["endpoints"].map((x) =>
//                     WpV2BlockTypesPNamespaceAZAZ09PNameAZAZ09Endpoint.fromMap(
//                         x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2BlockTypesPNamespaceAZAZ09PNameAZAZ09Endpoint {
//   WpV2BlockTypesPNamespaceAZAZ09PNameAZAZ09Endpoint({
//     this.methods,
//     this.args,
//   });

//   final List<Method> methods;
//   final IndigoArgs args;

//   factory WpV2BlockTypesPNamespaceAZAZ09PNameAZAZ09Endpoint.fromMap(
//           Map<String, dynamic> json) =>
//       WpV2BlockTypesPNamespaceAZAZ09PNameAZAZ09Endpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         args: json["args"] == null ? null : IndigoArgs.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class IndigoArgs {
//   IndigoArgs({
//     this.name,
//     this.namespace,
//     this.context,
//   });

//   final TermValue name;
//   final TermValue namespace;
//   final StatusClass context;

//   factory IndigoArgs.fromMap(Map<String, dynamic> json) => IndigoArgs(
//         name: json["name"] == null ? null : TermValue.fromMap(json["name"]),
//         namespace: json["namespace"] == null
//             ? null
//             : TermValue.fromMap(json["namespace"]),
//         context: json["context"] == null
//             ? null
//             : StatusClass.fromMap(json["context"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "name": name == null ? null : name.toMap(),
//         "namespace": namespace == null ? null : namespace.toMap(),
//         "context": context == null ? null : context.toMap(),
//       };
// }

// class WpV2Blocks {
//   WpV2Blocks({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//     this.links,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2BlocksEndpoint> endpoints;
//   final WpV2Links links;

//   factory WpV2Blocks.fromMap(Map<String, dynamic> json) => WpV2Blocks(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2BlocksEndpoint>.from(
//                 json["endpoints"].map((x) => WpV2BlocksEndpoint.fromMap(x))),
//         links:
//             json["_links"] == null ? null : WpV2Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//         "_links": links == null ? null : links.toMap(),
//       };
// }

// class WpV2BlocksEndpoint {
//   WpV2BlocksEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final IndecentArgs args;

//   factory WpV2BlocksEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2BlocksEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null ? null : IndecentArgs.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class IndecentArgs {
//   IndecentArgs({
//     this.context,
//     this.page,
//     this.perPage,
//     this.search,
//     this.after,
//     this.modifiedAfter,
//     this.before,
//     this.modifiedBefore,
//     this.exclude,
//     this.include,
//     this.offset,
//     this.order,
//     this.orderby,
//     this.slug,
//     this.status,
//     this.date,
//     this.dateGmt,
//     this.password,
//     this.title,
//     this.content,
//     this.template,
//   });

//   final StatusClass context;
//   final SrcValue page;
//   final SrcValue perPage;
//   final TermValue search;
//   final TermValue after;
//   final TermValue modifiedAfter;
//   final TermValue before;
//   final TermValue modifiedBefore;
//   final TermValue exclude;
//   final TermValue include;
//   final TermValue offset;
//   final StatusClass order;
//   final StatusClass orderby;
//   final TermValue slug;
//   final StatusClass status;
//   final Date date;
//   final Date dateGmt;
//   final TermValue password;
//   final TermValue title;
//   final TermValue content;
//   final TermValue template;

//   factory IndecentArgs.fromMap(Map<String, dynamic> json) => IndecentArgs(
//         context: json["context"] == null
//             ? null
//             : StatusClass.fromMap(json["context"]),
//         page: json["page"] == null ? null : SrcValue.fromMap(json["page"]),
//         perPage: json["per_page"] == null
//             ? null
//             : SrcValue.fromMap(json["per_page"]),
//         search:
//             json["search"] == null ? null : TermValue.fromMap(json["search"]),
//         after: json["after"] == null ? null : TermValue.fromMap(json["after"]),
//         modifiedAfter: json["modified_after"] == null
//             ? null
//             : TermValue.fromMap(json["modified_after"]),
//         before:
//             json["before"] == null ? null : TermValue.fromMap(json["before"]),
//         modifiedBefore: json["modified_before"] == null
//             ? null
//             : TermValue.fromMap(json["modified_before"]),
//         exclude:
//             json["exclude"] == null ? null : TermValue.fromMap(json["exclude"]),
//         include:
//             json["include"] == null ? null : TermValue.fromMap(json["include"]),
//         offset:
//             json["offset"] == null ? null : TermValue.fromMap(json["offset"]),
//         order:
//             json["order"] == null ? null : StatusClass.fromMap(json["order"]),
//         orderby: json["orderby"] == null
//             ? null
//             : StatusClass.fromMap(json["orderby"]),
//         slug: json["slug"] == null ? null : TermValue.fromMap(json["slug"]),
//         status:
//             json["status"] == null ? null : StatusClass.fromMap(json["status"]),
//         date: json["date"] == null ? null : Date.fromMap(json["date"]),
//         dateGmt:
//             json["date_gmt"] == null ? null : Date.fromMap(json["date_gmt"]),
//         password: json["password"] == null
//             ? null
//             : TermValue.fromMap(json["password"]),
//         title: json["title"] == null ? null : TermValue.fromMap(json["title"]),
//         content:
//             json["content"] == null ? null : TermValue.fromMap(json["content"]),
//         template: json["template"] == null
//             ? null
//             : TermValue.fromMap(json["template"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "context": context == null ? null : context.toMap(),
//         "page": page == null ? null : page.toMap(),
//         "per_page": perPage == null ? null : perPage.toMap(),
//         "search": search == null ? null : search.toMap(),
//         "after": after == null ? null : after.toMap(),
//         "modified_after": modifiedAfter == null ? null : modifiedAfter.toMap(),
//         "before": before == null ? null : before.toMap(),
//         "modified_before":
//             modifiedBefore == null ? null : modifiedBefore.toMap(),
//         "exclude": exclude == null ? null : exclude.toMap(),
//         "include": include == null ? null : include.toMap(),
//         "offset": offset == null ? null : offset.toMap(),
//         "order": order == null ? null : order.toMap(),
//         "orderby": orderby == null ? null : orderby.toMap(),
//         "slug": slug == null ? null : slug.toMap(),
//         "status": status == null ? null : status.toMap(),
//         "date": date == null ? null : date.toMap(),
//         "date_gmt": dateGmt == null ? null : dateGmt.toMap(),
//         "password": password == null ? null : password.toMap(),
//         "title": title == null ? null : title.toMap(),
//         "content": content == null ? null : content.toMap(),
//         "template": template == null ? null : template.toMap(),
//       };
// }

// class Date {
//   Date({
//     this.description,
//     this.type,
//     this.format,
//     this.required,
//     this.oneOf,
//     this.dateDefault,
//   });

//   final String description;
//   final List<TypeElement> type;
//   final Format format;
//   final bool required;
//   final List<DateOneOf> oneOf;
//   final String dateDefault;

//   factory Date.fromMap(Map<String, dynamic> json) => Date(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null
//             ? null
//             : List<TypeElement>.from(
//                 json["type"].map((x) => typeElementValues.map[x])),
//         format:
//             json["format"] == null ? null : formatValues.map[json["format"]],
//         required: json["required"] == null ? null : json["required"],
//         oneOf: json["oneOf"] == null
//             ? null
//             : List<DateOneOf>.from(
//                 json["oneOf"].map((x) => DateOneOf.fromMap(x))),
//         dateDefault: json["default"] == null ? null : json["default"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type == null
//             ? null
//             : List<dynamic>.from(type.map((x) => typeElementValues.reverse[x])),
//         "format": format == null ? null : formatValues.reverse[format],
//         "required": required == null ? null : required,
//         "oneOf": oneOf == null
//             ? null
//             : List<dynamic>.from(oneOf.map((x) => x.toMap())),
//         "default": dateDefault == null ? null : dateDefault,
//       };
// }

// class DateOneOf {
//   DateOneOf({
//     this.title,
//     this.description,
//     this.type,
//     this.items,
//     this.properties,
//     this.additionalProperties,
//   });

//   final String title;
//   final String description;
//   final TypeElement type;
//   final OneOfItems items;
//   final FluffyProperties properties;
//   final bool additionalProperties;

//   factory DateOneOf.fromMap(Map<String, dynamic> json) => DateOneOf(
//         title: json["title"] == null ? null : json["title"],
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         items: json["items"] == null ? null : OneOfItems.fromMap(json["items"]),
//         properties: json["properties"] == null
//             ? null
//             : FluffyProperties.fromMap(json["properties"]),
//         additionalProperties: json["additionalProperties"] == null
//             ? null
//             : json["additionalProperties"],
//       );

//   Map<String, dynamic> toMap() => {
//         "title": title == null ? null : title,
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "items": items == null ? null : items.toMap(),
//         "properties": properties == null ? null : properties.toMap(),
//         "additionalProperties":
//             additionalProperties == null ? null : additionalProperties,
//       };
// }

// class OneOfItems {
//   OneOfItems({
//     this.type,
//   });

//   final TypeElement type;

//   factory OneOfItems.fromMap(Map<String, dynamic> json) => OneOfItems(
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//       );

//   Map<String, dynamic> toMap() => {
//         "type": type == null ? null : typeElementValues.reverse[type],
//       };
// }

// class FluffyProperties {
//   FluffyProperties({
//     this.terms,
//     this.includeChildren,
//   });

//   final SrcValue terms;
//   final SrcValue includeChildren;

//   factory FluffyProperties.fromMap(Map<String, dynamic> json) =>
//       FluffyProperties(
//         terms: json["terms"] == null ? null : SrcValue.fromMap(json["terms"]),
//         includeChildren: json["include_children"] == null
//             ? null
//             : SrcValue.fromMap(json["include_children"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "terms": terms == null ? null : terms.toMap(),
//         "include_children":
//             includeChildren == null ? null : includeChildren.toMap(),
//       };
// }

// class WpV2BlocksPIdD {
//   WpV2BlocksPIdD({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2BlocksPIdDEndpoint> endpoints;

//   factory WpV2BlocksPIdD.fromMap(Map<String, dynamic> json) => WpV2BlocksPIdD(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2BlocksPIdDEndpoint>.from(json["endpoints"]
//                 .map((x) => WpV2BlocksPIdDEndpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2BlocksPIdDEndpoint {
//   WpV2BlocksPIdDEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final HilariousArgs args;

//   factory WpV2BlocksPIdDEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2BlocksPIdDEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null ? null : HilariousArgs.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class HilariousArgs {
//   HilariousArgs({
//     this.id,
//     this.context,
//     this.password,
//     this.date,
//     this.dateGmt,
//     this.slug,
//     this.status,
//     this.title,
//     this.content,
//     this.template,
//     this.force,
//     this.parent,
//   });

//   final TermValue id;
//   final StatusClass context;
//   final TermValue password;
//   final Date date;
//   final Date dateGmt;
//   final TermValue slug;
//   final TermValue status;
//   final TermValue title;
//   final TermValue content;
//   final TermValue template;
//   final TermValue force;
//   final TermValue parent;

//   factory HilariousArgs.fromMap(Map<String, dynamic> json) => HilariousArgs(
//         id: json["id"] == null ? null : TermValue.fromMap(json["id"]),
//         context: json["context"] == null
//             ? null
//             : StatusClass.fromMap(json["context"]),
//         password: json["password"] == null
//             ? null
//             : TermValue.fromMap(json["password"]),
//         date: json["date"] == null ? null : Date.fromMap(json["date"]),
//         dateGmt:
//             json["date_gmt"] == null ? null : Date.fromMap(json["date_gmt"]),
//         slug: json["slug"] == null ? null : TermValue.fromMap(json["slug"]),
//         status:
//             json["status"] == null ? null : TermValue.fromMap(json["status"]),
//         title: json["title"] == null ? null : TermValue.fromMap(json["title"]),
//         content:
//             json["content"] == null ? null : TermValue.fromMap(json["content"]),
//         template: json["template"] == null
//             ? null
//             : TermValue.fromMap(json["template"]),
//         force: json["force"] == null ? null : TermValue.fromMap(json["force"]),
//         parent:
//             json["parent"] == null ? null : TermValue.fromMap(json["parent"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id.toMap(),
//         "context": context == null ? null : context.toMap(),
//         "password": password == null ? null : password.toMap(),
//         "date": date == null ? null : date.toMap(),
//         "date_gmt": dateGmt == null ? null : dateGmt.toMap(),
//         "slug": slug == null ? null : slug.toMap(),
//         "status": status == null ? null : status.toMap(),
//         "title": title == null ? null : title.toMap(),
//         "content": content == null ? null : content.toMap(),
//         "template": template == null ? null : template.toMap(),
//         "force": force == null ? null : force.toMap(),
//         "parent": parent == null ? null : parent.toMap(),
//       };
// }

// class WpV2BlocksPParentDAutosavesPIdDClass {
//   WpV2BlocksPParentDAutosavesPIdDClass({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<Method> methods;
//   final List<WpV2BlocksPParentDAutosavesPIdDEndpoint> endpoints;

//   factory WpV2BlocksPParentDAutosavesPIdDClass.fromMap(
//           Map<String, dynamic> json) =>
//       WpV2BlocksPParentDAutosavesPIdDClass(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2BlocksPParentDAutosavesPIdDEndpoint>.from(
//                 json["endpoints"].map(
//                     (x) => WpV2BlocksPParentDAutosavesPIdDEndpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2BlocksPParentDAutosavesPIdDEndpoint {
//   WpV2BlocksPParentDAutosavesPIdDEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<Method> methods;
//   final AmbitiousArgs args;

//   factory WpV2BlocksPParentDAutosavesPIdDEndpoint.fromMap(
//           Map<String, dynamic> json) =>
//       WpV2BlocksPParentDAutosavesPIdDEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         args: json["args"] == null ? null : AmbitiousArgs.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class AmbitiousArgs {
//   AmbitiousArgs({
//     this.parent,
//     this.id,
//     this.context,
//     this.force,
//   });

//   final Id parent;
//   final Id id;
//   final PurpleContext context;
//   final Force force;

//   factory AmbitiousArgs.fromMap(Map<String, dynamic> json) => AmbitiousArgs(
//         parent: json["parent"] == null ? null : Id.fromMap(json["parent"]),
//         id: json["id"] == null ? null : Id.fromMap(json["id"]),
//         context: json["context"] == null
//             ? null
//             : PurpleContext.fromMap(json["context"]),
//         force: json["force"] == null ? null : Force.fromMap(json["force"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "parent": parent == null ? null : parent.toMap(),
//         "id": id == null ? null : id.toMap(),
//         "context": context == null ? null : context.toMap(),
//         "force": force == null ? null : force.toMap(),
//       };
// }

// class PurpleContext {
//   PurpleContext({
//     this.description,
//     this.type,
//     this.contextEnum,
//     this.contextDefault,
//     this.required,
//   });

//   final ContextDescription description;
//   final TypeElement type;
//   final List<String> contextEnum;
//   final DefaultEnum contextDefault;
//   final bool required;

//   factory PurpleContext.fromMap(Map<String, dynamic> json) => PurpleContext(
//         description: json["description"] == null
//             ? null
//             : contextDescriptionValues.map[json["description"]],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         contextEnum: json["enum"] == null
//             ? null
//             : List<String>.from(json["enum"].map((x) => x)),
//         contextDefault: json["default"] == null
//             ? null
//             : defaultEnumValues.map[json["default"]],
//         required: json["required"] == null ? null : json["required"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null
//             ? null
//             : contextDescriptionValues.reverse[description],
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "enum": contextEnum == null
//             ? null
//             : List<dynamic>.from(contextEnum.map((x) => x)),
//         "default": contextDefault == null
//             ? null
//             : defaultEnumValues.reverse[contextDefault],
//         "required": required == null ? null : required,
//       };
// }

// enum ContextDescription { EMPTY, DESCRIPTION, PURPLE, FLUFFY }

// final contextDescriptionValues = EnumValues({
//   "Упорядочить сортировку атрибута по возрастанию или убыванию.":
//       ContextDescription.DESCRIPTION,
//   "Рамки в которых сделан запрос, определяют поля в ответе.":
//       ContextDescription.EMPTY,
//   "Сортировать коллекцию по атрибутам элемента.": ContextDescription.FLUFFY,
//   "Сортировать коллекцию по атрибуту объекта.": ContextDescription.PURPLE
// });

// class Force {
//   Force({
//     this.type,
//     this.forceDefault,
//     this.description,
//     this.required,
//   });

//   final TypeElement type;
//   final bool forceDefault;
//   final String description;
//   final bool required;

//   factory Force.fromMap(Map<String, dynamic> json) => Force(
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         forceDefault: json["default"] == null ? null : json["default"],
//         description: json["description"] == null ? null : json["description"],
//         required: json["required"] == null ? null : json["required"],
//       );

//   Map<String, dynamic> toMap() => {
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "default": forceDefault == null ? null : forceDefault,
//         "description": description == null ? null : description,
//         "required": required == null ? null : required,
//       };
// }

// class Id {
//   Id({
//     this.description,
//     this.type,
//     this.required,
//   });

//   final String description;
//   final TypeElement type;
//   final bool required;

//   factory Id.fromMap(Map<String, dynamic> json) => Id(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         required: json["required"] == null ? null : json["required"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "required": required == null ? null : required,
//       };
// }

// class WpV2SPParentDRevisions {
//   WpV2SPParentDRevisions({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<Method> methods;
//   final List<WpV2BlocksPParentDRevisionsEndpoint> endpoints;

//   factory WpV2SPParentDRevisions.fromMap(Map<String, dynamic> json) =>
//       WpV2SPParentDRevisions(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2BlocksPParentDRevisionsEndpoint>.from(json["endpoints"]
//                 .map((x) => WpV2BlocksPParentDRevisionsEndpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2BlocksPParentDRevisionsEndpoint {
//   WpV2BlocksPParentDRevisionsEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<Method> methods;
//   final CunningArgs args;

//   factory WpV2BlocksPParentDRevisionsEndpoint.fromMap(
//           Map<String, dynamic> json) =>
//       WpV2BlocksPParentDRevisionsEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         args: json["args"] == null ? null : CunningArgs.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class CunningArgs {
//   CunningArgs({
//     this.parent,
//     this.context,
//     this.page,
//     this.perPage,
//     this.search,
//     this.exclude,
//     this.include,
//     this.offset,
//     this.order,
//     this.orderby,
//   });

//   final Id parent;
//   final PurpleContext context;
//   final Page page;
//   final PurplePerPage perPage;
//   final Id search;
//   final Exclude exclude;
//   final Exclude include;
//   final Id offset;
//   final PurpleContext order;
//   final PurpleContext orderby;

//   factory CunningArgs.fromMap(Map<String, dynamic> json) => CunningArgs(
//         parent: json["parent"] == null ? null : Id.fromMap(json["parent"]),
//         context: json["context"] == null
//             ? null
//             : PurpleContext.fromMap(json["context"]),
//         page: json["page"] == null ? null : Page.fromMap(json["page"]),
//         perPage: json["per_page"] == null
//             ? null
//             : PurplePerPage.fromMap(json["per_page"]),
//         search: json["search"] == null ? null : Id.fromMap(json["search"]),
//         exclude:
//             json["exclude"] == null ? null : Exclude.fromMap(json["exclude"]),
//         include:
//             json["include"] == null ? null : Exclude.fromMap(json["include"]),
//         offset: json["offset"] == null ? null : Id.fromMap(json["offset"]),
//         order:
//             json["order"] == null ? null : PurpleContext.fromMap(json["order"]),
//         orderby: json["orderby"] == null
//             ? null
//             : PurpleContext.fromMap(json["orderby"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "parent": parent == null ? null : parent.toMap(),
//         "context": context == null ? null : context.toMap(),
//         "page": page == null ? null : page.toMap(),
//         "per_page": perPage == null ? null : perPage.toMap(),
//         "search": search == null ? null : search.toMap(),
//         "exclude": exclude == null ? null : exclude.toMap(),
//         "include": include == null ? null : include.toMap(),
//         "offset": offset == null ? null : offset.toMap(),
//         "order": order == null ? null : order.toMap(),
//         "orderby": orderby == null ? null : orderby.toMap(),
//       };
// }

// class Exclude {
//   Exclude({
//     this.description,
//     this.type,
//     this.items,
//     this.excludeDefault,
//     this.required,
//   });

//   final String description;
//   final TypeElement type;
//   final OneOfItems items;
//   final List<dynamic> excludeDefault;
//   final bool required;

//   factory Exclude.fromMap(Map<String, dynamic> json) => Exclude(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         items: json["items"] == null ? null : OneOfItems.fromMap(json["items"]),
//         excludeDefault: json["default"] == null
//             ? null
//             : List<dynamic>.from(json["default"].map((x) => x)),
//         required: json["required"] == null ? null : json["required"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "items": items == null ? null : items.toMap(),
//         "default": excludeDefault == null
//             ? null
//             : List<dynamic>.from(excludeDefault.map((x) => x)),
//         "required": required == null ? null : required,
//       };
// }

// class Page {
//   Page({
//     this.description,
//     this.type,
//     this.pageDefault,
//     this.minimum,
//     this.required,
//   });

//   final String description;
//   final TypeElement type;
//   final int pageDefault;
//   final int minimum;
//   final bool required;

//   factory Page.fromMap(Map<String, dynamic> json) => Page(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         pageDefault: json["default"] == null ? null : json["default"],
//         minimum: json["minimum"] == null ? null : json["minimum"],
//         required: json["required"] == null ? null : json["required"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "default": pageDefault == null ? null : pageDefault,
//         "minimum": minimum == null ? null : minimum,
//         "required": required == null ? null : required,
//       };
// }

// class PurplePerPage {
//   PurplePerPage({
//     this.description,
//     this.type,
//     this.minimum,
//     this.maximum,
//     this.required,
//   });

//   final String description;
//   final TypeElement type;
//   final int minimum;
//   final int maximum;
//   final bool required;

//   factory PurplePerPage.fromMap(Map<String, dynamic> json) => PurplePerPage(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         minimum: json["minimum"] == null ? null : json["minimum"],
//         maximum: json["maximum"] == null ? null : json["maximum"],
//         required: json["required"] == null ? null : json["required"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "minimum": minimum == null ? null : minimum,
//         "maximum": maximum == null ? null : maximum,
//         "required": required == null ? null : required,
//       };
// }

// class WpV2CategoriesClass {
//   WpV2CategoriesClass({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//     this.links,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2CategoriesEndpoint> endpoints;
//   final WpV2Links links;

//   factory WpV2CategoriesClass.fromMap(Map<String, dynamic> json) =>
//       WpV2CategoriesClass(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2CategoriesEndpoint>.from(json["endpoints"]
//                 .map((x) => WpV2CategoriesEndpoint.fromMap(x))),
//         links:
//             json["_links"] == null ? null : WpV2Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//         "_links": links == null ? null : links.toMap(),
//       };
// }

// class WpV2CategoriesEndpoint {
//   WpV2CategoriesEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final MagentaArgs args;

//   factory WpV2CategoriesEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2CategoriesEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null ? null : MagentaArgs.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class MagentaArgs {
//   MagentaArgs({
//     this.context,
//     this.page,
//     this.perPage,
//     this.search,
//     this.exclude,
//     this.include,
//     this.order,
//     this.orderby,
//     this.hideEmpty,
//     this.parent,
//     this.post,
//     this.slug,
//     this.description,
//     this.name,
//     this.meta,
//     this.offset,
//   });

//   final StatusClass context;
//   final Page page;
//   final FluffyPerPage perPage;
//   final Id search;
//   final Exclude exclude;
//   final Exclude include;
//   final PurpleContext order;
//   final PurpleContext orderby;
//   final Force hideEmpty;
//   final TermValue parent;
//   final Force post;
//   final Slug slug;
//   final Id description;
//   final Id name;
//   final Meta meta;
//   final StatusClass offset;

//   factory MagentaArgs.fromMap(Map<String, dynamic> json) => MagentaArgs(
//         context: json["context"] == null
//             ? null
//             : StatusClass.fromMap(json["context"]),
//         page: json["page"] == null ? null : Page.fromMap(json["page"]),
//         perPage: json["per_page"] == null
//             ? null
//             : FluffyPerPage.fromMap(json["per_page"]),
//         search: json["search"] == null ? null : Id.fromMap(json["search"]),
//         exclude:
//             json["exclude"] == null ? null : Exclude.fromMap(json["exclude"]),
//         include:
//             json["include"] == null ? null : Exclude.fromMap(json["include"]),
//         order:
//             json["order"] == null ? null : PurpleContext.fromMap(json["order"]),
//         orderby: json["orderby"] == null
//             ? null
//             : PurpleContext.fromMap(json["orderby"]),
//         hideEmpty: json["hide_empty"] == null
//             ? null
//             : Force.fromMap(json["hide_empty"]),
//         parent:
//             json["parent"] == null ? null : TermValue.fromMap(json["parent"]),
//         post: json["post"] == null ? null : Force.fromMap(json["post"]),
//         slug: json["slug"] == null ? null : Slug.fromMap(json["slug"]),
//         description: json["description"] == null
//             ? null
//             : Id.fromMap(json["description"]),
//         name: json["name"] == null ? null : Id.fromMap(json["name"]),
//         meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
//         offset:
//             json["offset"] == null ? null : StatusClass.fromMap(json["offset"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "context": context == null ? null : context.toMap(),
//         "page": page == null ? null : page.toMap(),
//         "per_page": perPage == null ? null : perPage.toMap(),
//         "search": search == null ? null : search.toMap(),
//         "exclude": exclude == null ? null : exclude.toMap(),
//         "include": include == null ? null : include.toMap(),
//         "order": order == null ? null : order.toMap(),
//         "orderby": orderby == null ? null : orderby.toMap(),
//         "hide_empty": hideEmpty == null ? null : hideEmpty.toMap(),
//         "parent": parent == null ? null : parent.toMap(),
//         "post": post == null ? null : post.toMap(),
//         "slug": slug == null ? null : slug.toMap(),
//         "description": description == null ? null : description.toMap(),
//         "name": name == null ? null : name.toMap(),
//         "meta": meta == null ? null : meta.toMap(),
//         "offset": offset == null ? null : offset.toMap(),
//       };
// }

// class Meta {
//   Meta({
//     this.description,
//     this.type,
//     this.properties,
//     this.required,
//   });

//   final MetaDescription description;
//   final TypeElement type;
//   final List<dynamic> properties;
//   final bool required;

//   factory Meta.fromMap(Map<String, dynamic> json) => Meta(
//         description: json["description"] == null
//             ? null
//             : metaDescriptionValues.map[json["description"]],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         properties: json["properties"] == null
//             ? null
//             : List<dynamic>.from(json["properties"].map((x) => x)),
//         required: json["required"] == null ? null : json["required"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null
//             ? null
//             : metaDescriptionValues.reverse[description],
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "properties": properties == null
//             ? null
//             : List<dynamic>.from(properties.map((x) => x)),
//         "required": required == null ? null : required,
//       };
// }

// enum MetaDescription { EMPTY }

// final metaDescriptionValues = EnumValues({"Мета поля.": MetaDescription.EMPTY});

// class FluffyPerPage {
//   FluffyPerPage({
//     this.description,
//     this.type,
//     this.perPageDefault,
//     this.minimum,
//     this.maximum,
//     this.required,
//   });

//   final String description;
//   final TypeElement type;
//   final int perPageDefault;
//   final int minimum;
//   final int maximum;
//   final bool required;

//   factory FluffyPerPage.fromMap(Map<String, dynamic> json) => FluffyPerPage(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         perPageDefault: json["default"] == null ? null : json["default"],
//         minimum: json["minimum"] == null ? null : json["minimum"],
//         maximum: json["maximum"] == null ? null : json["maximum"],
//         required: json["required"] == null ? null : json["required"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "default": perPageDefault == null ? null : perPageDefault,
//         "minimum": minimum == null ? null : minimum,
//         "maximum": maximum == null ? null : maximum,
//         "required": required == null ? null : required,
//       };
// }

// class Slug {
//   Slug({
//     this.description,
//     this.type,
//     this.items,
//     this.required,
//   });

//   final String description;
//   final TypeElement type;
//   final OneOfItems items;
//   final bool required;

//   factory Slug.fromMap(Map<String, dynamic> json) => Slug(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         items: json["items"] == null ? null : OneOfItems.fromMap(json["items"]),
//         required: json["required"] == null ? null : json["required"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "items": items == null ? null : items.toMap(),
//         "required": required == null ? null : required,
//       };
// }

// class WpV2CategoriesPIdDClass {
//   WpV2CategoriesPIdDClass({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2CategoriesPIdDEndpoint> endpoints;

//   factory WpV2CategoriesPIdDClass.fromMap(Map<String, dynamic> json) =>
//       WpV2CategoriesPIdDClass(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2CategoriesPIdDEndpoint>.from(json["endpoints"]
//                 .map((x) => WpV2CategoriesPIdDEndpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2CategoriesPIdDEndpoint {
//   WpV2CategoriesPIdDEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final FriskyArgs args;

//   factory WpV2CategoriesPIdDEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2CategoriesPIdDEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null ? null : FriskyArgs.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class FriskyArgs {
//   FriskyArgs({
//     this.id,
//     this.context,
//     this.description,
//     this.name,
//     this.slug,
//     this.parent,
//     this.meta,
//     this.force,
//   });

//   final Id id;
//   final PurpleContext context;
//   final Id description;
//   final Id name;
//   final Id slug;
//   final SrcValue parent;
//   final Meta meta;
//   final Force force;

//   factory FriskyArgs.fromMap(Map<String, dynamic> json) => FriskyArgs(
//         id: json["id"] == null ? null : Id.fromMap(json["id"]),
//         context: json["context"] == null
//             ? null
//             : PurpleContext.fromMap(json["context"]),
//         description: json["description"] == null
//             ? null
//             : Id.fromMap(json["description"]),
//         name: json["name"] == null ? null : Id.fromMap(json["name"]),
//         slug: json["slug"] == null ? null : Id.fromMap(json["slug"]),
//         parent:
//             json["parent"] == null ? null : SrcValue.fromMap(json["parent"]),
//         meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
//         force: json["force"] == null ? null : Force.fromMap(json["force"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id.toMap(),
//         "context": context == null ? null : context.toMap(),
//         "description": description == null ? null : description.toMap(),
//         "name": name == null ? null : name.toMap(),
//         "slug": slug == null ? null : slug.toMap(),
//         "parent": parent == null ? null : parent.toMap(),
//         "meta": meta == null ? null : meta.toMap(),
//         "force": force == null ? null : force.toMap(),
//       };
// }

// class WpV2Comments {
//   WpV2Comments({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//     this.links,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2CommentsEndpoint> endpoints;
//   final WpV2Links links;

//   factory WpV2Comments.fromMap(Map<String, dynamic> json) => WpV2Comments(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2CommentsEndpoint>.from(
//                 json["endpoints"].map((x) => WpV2CommentsEndpoint.fromMap(x))),
//         links:
//             json["_links"] == null ? null : WpV2Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//         "_links": links == null ? null : links.toMap(),
//       };
// }

// class WpV2CommentsEndpoint {
//   WpV2CommentsEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final MischievousArgs args;

//   factory WpV2CommentsEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2CommentsEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args:
//             json["args"] == null ? null : MischievousArgs.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class MischievousArgs {
//   MischievousArgs({
//     this.context,
//     this.page,
//     this.perPage,
//     this.search,
//     this.after,
//     this.author,
//     this.authorExclude,
//     this.authorEmail,
//     this.before,
//     this.exclude,
//     this.include,
//     this.offset,
//     this.order,
//     this.orderby,
//     this.parent,
//     this.parentExclude,
//     this.post,
//     this.status,
//     this.type,
//     this.password,
//     this.authorIp,
//     this.authorName,
//     this.authorUrl,
//     this.authorUserAgent,
//     this.content,
//     this.date,
//     this.dateGmt,
//     this.meta,
//   });

//   final StatusClass context;
//   final StatusClass page;
//   final StatusClass perPage;
//   final StatusClass search;
//   final TermValue after;
//   final TermValue author;
//   final TermValue authorExclude;
//   final StatusClass authorEmail;
//   final TermValue before;
//   final StatusClass exclude;
//   final StatusClass include;
//   final StatusClass offset;
//   final StatusClass order;
//   final StatusClass orderby;
//   final StatusClass parent;
//   final StatusClass parentExclude;
//   final StatusClass post;
//   final StatusClass status;
//   final StatusClass type;
//   final StatusClass password;
//   final TermValue authorIp;
//   final TermValue authorName;
//   final TermValue authorUrl;
//   final TermValue authorUserAgent;
//   final TermValue content;
//   final StatusClass date;
//   final StatusClass dateGmt;
//   final StatusClass meta;

//   factory MischievousArgs.fromMap(Map<String, dynamic> json) => MischievousArgs(
//         context: json["context"] == null
//             ? null
//             : StatusClass.fromMap(json["context"]),
//         page: json["page"] == null ? null : StatusClass.fromMap(json["page"]),
//         perPage: json["per_page"] == null
//             ? null
//             : StatusClass.fromMap(json["per_page"]),
//         search:
//             json["search"] == null ? null : StatusClass.fromMap(json["search"]),
//         after: json["after"] == null ? null : TermValue.fromMap(json["after"]),
//         author:
//             json["author"] == null ? null : TermValue.fromMap(json["author"]),
//         authorExclude: json["author_exclude"] == null
//             ? null
//             : TermValue.fromMap(json["author_exclude"]),
//         authorEmail: json["author_email"] == null
//             ? null
//             : StatusClass.fromMap(json["author_email"]),
//         before:
//             json["before"] == null ? null : TermValue.fromMap(json["before"]),
//         exclude: json["exclude"] == null
//             ? null
//             : StatusClass.fromMap(json["exclude"]),
//         include: json["include"] == null
//             ? null
//             : StatusClass.fromMap(json["include"]),
//         offset:
//             json["offset"] == null ? null : StatusClass.fromMap(json["offset"]),
//         order:
//             json["order"] == null ? null : StatusClass.fromMap(json["order"]),
//         orderby: json["orderby"] == null
//             ? null
//             : StatusClass.fromMap(json["orderby"]),
//         parent:
//             json["parent"] == null ? null : StatusClass.fromMap(json["parent"]),
//         parentExclude: json["parent_exclude"] == null
//             ? null
//             : StatusClass.fromMap(json["parent_exclude"]),
//         post: json["post"] == null ? null : StatusClass.fromMap(json["post"]),
//         status:
//             json["status"] == null ? null : StatusClass.fromMap(json["status"]),
//         type: json["type"] == null ? null : StatusClass.fromMap(json["type"]),
//         password: json["password"] == null
//             ? null
//             : StatusClass.fromMap(json["password"]),
//         authorIp: json["author_ip"] == null
//             ? null
//             : TermValue.fromMap(json["author_ip"]),
//         authorName: json["author_name"] == null
//             ? null
//             : TermValue.fromMap(json["author_name"]),
//         authorUrl: json["author_url"] == null
//             ? null
//             : TermValue.fromMap(json["author_url"]),
//         authorUserAgent: json["author_user_agent"] == null
//             ? null
//             : TermValue.fromMap(json["author_user_agent"]),
//         content:
//             json["content"] == null ? null : TermValue.fromMap(json["content"]),
//         date: json["date"] == null ? null : StatusClass.fromMap(json["date"]),
//         dateGmt: json["date_gmt"] == null
//             ? null
//             : StatusClass.fromMap(json["date_gmt"]),
//         meta: json["meta"] == null ? null : StatusClass.fromMap(json["meta"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "context": context == null ? null : context.toMap(),
//         "page": page == null ? null : page.toMap(),
//         "per_page": perPage == null ? null : perPage.toMap(),
//         "search": search == null ? null : search.toMap(),
//         "after": after == null ? null : after.toMap(),
//         "author": author == null ? null : author.toMap(),
//         "author_exclude": authorExclude == null ? null : authorExclude.toMap(),
//         "author_email": authorEmail == null ? null : authorEmail.toMap(),
//         "before": before == null ? null : before.toMap(),
//         "exclude": exclude == null ? null : exclude.toMap(),
//         "include": include == null ? null : include.toMap(),
//         "offset": offset == null ? null : offset.toMap(),
//         "order": order == null ? null : order.toMap(),
//         "orderby": orderby == null ? null : orderby.toMap(),
//         "parent": parent == null ? null : parent.toMap(),
//         "parent_exclude": parentExclude == null ? null : parentExclude.toMap(),
//         "post": post == null ? null : post.toMap(),
//         "status": status == null ? null : status.toMap(),
//         "type": type == null ? null : type.toMap(),
//         "password": password == null ? null : password.toMap(),
//         "author_ip": authorIp == null ? null : authorIp.toMap(),
//         "author_name": authorName == null ? null : authorName.toMap(),
//         "author_url": authorUrl == null ? null : authorUrl.toMap(),
//         "author_user_agent":
//             authorUserAgent == null ? null : authorUserAgent.toMap(),
//         "content": content == null ? null : content.toMap(),
//         "date": date == null ? null : date.toMap(),
//         "date_gmt": dateGmt == null ? null : dateGmt.toMap(),
//         "meta": meta == null ? null : meta.toMap(),
//       };
// }

// class WpV2CommentsPIdD {
//   WpV2CommentsPIdD({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2CommentsPIdDEndpoint> endpoints;

//   factory WpV2CommentsPIdD.fromMap(Map<String, dynamic> json) =>
//       WpV2CommentsPIdD(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2CommentsPIdDEndpoint>.from(json["endpoints"]
//                 .map((x) => WpV2CommentsPIdDEndpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2CommentsPIdDEndpoint {
//   WpV2CommentsPIdDEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final Map<String, SrcValue> args;

//   factory WpV2CommentsPIdDEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2CommentsPIdDEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null
//             ? null
//             : Map.from(json["args"]).map(
//                 (k, v) => MapEntry<String, SrcValue>(k, SrcValue.fromMap(v))),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null
//             ? null
//             : Map.from(args)
//                 .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
//       };
// }

// class WpV2MediaClass {
//   WpV2MediaClass({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//     this.links,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2MediaEndpoint> endpoints;
//   final WpV2Links links;

//   factory WpV2MediaClass.fromMap(Map<String, dynamic> json) => WpV2MediaClass(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2MediaEndpoint>.from(
//                 json["endpoints"].map((x) => WpV2MediaEndpoint.fromMap(x))),
//         links:
//             json["_links"] == null ? null : WpV2Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//         "_links": links == null ? null : links.toMap(),
//       };
// }

// class WpV2MediaEndpoint {
//   WpV2MediaEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final BraggadociousArgs args;

//   factory WpV2MediaEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2MediaEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null
//             ? null
//             : BraggadociousArgs.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class BraggadociousArgs {
//   BraggadociousArgs({
//     this.context,
//     this.page,
//     this.perPage,
//     this.search,
//     this.after,
//     this.modifiedAfter,
//     this.author,
//     this.authorExclude,
//     this.before,
//     this.modifiedBefore,
//     this.exclude,
//     this.include,
//     this.offset,
//     this.order,
//     this.orderby,
//     this.parent,
//     this.parentExclude,
//     this.slug,
//     this.status,
//     this.mediaType,
//     this.mimeType,
//     this.date,
//     this.dateGmt,
//     this.title,
//     this.commentStatus,
//     this.pingStatus,
//     this.meta,
//     this.template,
//     this.altText,
//     this.caption,
//     this.description,
//     this.post,
//     this.menuOrder,
//     this.password,
//     this.content,
//     this.excerpt,
//     this.featuredMedia,
//     this.taxRelation,
//     this.categories,
//     this.categoriesExclude,
//     this.tags,
//     this.tagsExclude,
//     this.sticky,
//     this.format,
//   });

//   final PurpleContext context;
//   final TermValue page;
//   final TermValue perPage;
//   final TermValue search;
//   final After after;
//   final TermValue modifiedAfter;
//   final Exclude author;
//   final Exclude authorExclude;
//   final After before;
//   final TermValue modifiedBefore;
//   final TermValue exclude;
//   final TermValue include;
//   final TermValue offset;
//   final TermValue order;
//   final TermValue orderby;
//   final TermValue parent;
//   final TermValue parentExclude;
//   final TermValue slug;
//   final TermValue status;
//   final TermValue mediaType;
//   final TermValue mimeType;
//   final Date date;
//   final Date dateGmt;
//   final TermValue title;
//   final CommentStatus commentStatus;
//   final TermValue pingStatus;
//   final TermValue meta;
//   final TermValue template;
//   final TermValue altText;
//   final TermValue caption;
//   final TermValue description;
//   final TermValue post;
//   final TermValue menuOrder;
//   final TermValue password;
//   final Content content;
//   final TermValue excerpt;
//   final TermValue featuredMedia;
//   final TermValue taxRelation;
//   final Categories categories;
//   final Date categoriesExclude;
//   final Tags tags;
//   final Date tagsExclude;
//   final TermValue sticky;
//   final TermValue format;

//   factory BraggadociousArgs.fromMap(Map<String, dynamic> json) =>
//       BraggadociousArgs(
//         context: json["context"] == null
//             ? null
//             : PurpleContext.fromMap(json["context"]),
//         page: json["page"] == null ? null : TermValue.fromMap(json["page"]),
//         perPage: json["per_page"] == null
//             ? null
//             : TermValue.fromMap(json["per_page"]),
//         search:
//             json["search"] == null ? null : TermValue.fromMap(json["search"]),
//         after: json["after"] == null ? null : After.fromMap(json["after"]),
//         modifiedAfter: json["modified_after"] == null
//             ? null
//             : TermValue.fromMap(json["modified_after"]),
//         author: json["author"] == null ? null : Exclude.fromMap(json["author"]),
//         authorExclude: json["author_exclude"] == null
//             ? null
//             : Exclude.fromMap(json["author_exclude"]),
//         before: json["before"] == null ? null : After.fromMap(json["before"]),
//         modifiedBefore: json["modified_before"] == null
//             ? null
//             : TermValue.fromMap(json["modified_before"]),
//         exclude:
//             json["exclude"] == null ? null : TermValue.fromMap(json["exclude"]),
//         include:
//             json["include"] == null ? null : TermValue.fromMap(json["include"]),
//         offset:
//             json["offset"] == null ? null : TermValue.fromMap(json["offset"]),
//         order: json["order"] == null ? null : TermValue.fromMap(json["order"]),
//         orderby:
//             json["orderby"] == null ? null : TermValue.fromMap(json["orderby"]),
//         parent:
//             json["parent"] == null ? null : TermValue.fromMap(json["parent"]),
//         parentExclude: json["parent_exclude"] == null
//             ? null
//             : TermValue.fromMap(json["parent_exclude"]),
//         slug: json["slug"] == null ? null : TermValue.fromMap(json["slug"]),
//         status:
//             json["status"] == null ? null : TermValue.fromMap(json["status"]),
//         mediaType: json["media_type"] == null
//             ? null
//             : TermValue.fromMap(json["media_type"]),
//         mimeType: json["mime_type"] == null
//             ? null
//             : TermValue.fromMap(json["mime_type"]),
//         date: json["date"] == null ? null : Date.fromMap(json["date"]),
//         dateGmt:
//             json["date_gmt"] == null ? null : Date.fromMap(json["date_gmt"]),
//         title: json["title"] == null ? null : TermValue.fromMap(json["title"]),
//         commentStatus: json["comment_status"] == null
//             ? null
//             : CommentStatus.fromMap(json["comment_status"]),
//         pingStatus: json["ping_status"] == null
//             ? null
//             : TermValue.fromMap(json["ping_status"]),
//         meta: json["meta"] == null ? null : TermValue.fromMap(json["meta"]),
//         template: json["template"] == null
//             ? null
//             : TermValue.fromMap(json["template"]),
//         altText: json["alt_text"] == null
//             ? null
//             : TermValue.fromMap(json["alt_text"]),
//         caption:
//             json["caption"] == null ? null : TermValue.fromMap(json["caption"]),
//         description: json["description"] == null
//             ? null
//             : TermValue.fromMap(json["description"]),
//         post: json["post"] == null ? null : TermValue.fromMap(json["post"]),
//         menuOrder: json["menu_order"] == null
//             ? null
//             : TermValue.fromMap(json["menu_order"]),
//         password: json["password"] == null
//             ? null
//             : TermValue.fromMap(json["password"]),
//         content:
//             json["content"] == null ? null : Content.fromMap(json["content"]),
//         excerpt:
//             json["excerpt"] == null ? null : TermValue.fromMap(json["excerpt"]),
//         featuredMedia: json["featured_media"] == null
//             ? null
//             : TermValue.fromMap(json["featured_media"]),
//         taxRelation: json["tax_relation"] == null
//             ? null
//             : TermValue.fromMap(json["tax_relation"]),
//         categories: json["categories"] == null
//             ? null
//             : Categories.fromMap(json["categories"]),
//         categoriesExclude: json["categories_exclude"] == null
//             ? null
//             : Date.fromMap(json["categories_exclude"]),
//         tags: json["tags"] == null ? null : Tags.fromMap(json["tags"]),
//         tagsExclude: json["tags_exclude"] == null
//             ? null
//             : Date.fromMap(json["tags_exclude"]),
//         sticky:
//             json["sticky"] == null ? null : TermValue.fromMap(json["sticky"]),
//         format:
//             json["format"] == null ? null : TermValue.fromMap(json["format"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "context": context == null ? null : context.toMap(),
//         "page": page == null ? null : page.toMap(),
//         "per_page": perPage == null ? null : perPage.toMap(),
//         "search": search == null ? null : search.toMap(),
//         "after": after == null ? null : after.toMap(),
//         "modified_after": modifiedAfter == null ? null : modifiedAfter.toMap(),
//         "author": author == null ? null : author.toMap(),
//         "author_exclude": authorExclude == null ? null : authorExclude.toMap(),
//         "before": before == null ? null : before.toMap(),
//         "modified_before":
//             modifiedBefore == null ? null : modifiedBefore.toMap(),
//         "exclude": exclude == null ? null : exclude.toMap(),
//         "include": include == null ? null : include.toMap(),
//         "offset": offset == null ? null : offset.toMap(),
//         "order": order == null ? null : order.toMap(),
//         "orderby": orderby == null ? null : orderby.toMap(),
//         "parent": parent == null ? null : parent.toMap(),
//         "parent_exclude": parentExclude == null ? null : parentExclude.toMap(),
//         "slug": slug == null ? null : slug.toMap(),
//         "status": status == null ? null : status.toMap(),
//         "media_type": mediaType == null ? null : mediaType.toMap(),
//         "mime_type": mimeType == null ? null : mimeType.toMap(),
//         "date": date == null ? null : date.toMap(),
//         "date_gmt": dateGmt == null ? null : dateGmt.toMap(),
//         "title": title == null ? null : title.toMap(),
//         "comment_status": commentStatus == null ? null : commentStatus.toMap(),
//         "ping_status": pingStatus == null ? null : pingStatus.toMap(),
//         "meta": meta == null ? null : meta.toMap(),
//         "template": template == null ? null : template.toMap(),
//         "alt_text": altText == null ? null : altText.toMap(),
//         "caption": caption == null ? null : caption.toMap(),
//         "description": description == null ? null : description.toMap(),
//         "post": post == null ? null : post.toMap(),
//         "menu_order": menuOrder == null ? null : menuOrder.toMap(),
//         "password": password == null ? null : password.toMap(),
//         "content": content == null ? null : content.toMap(),
//         "excerpt": excerpt == null ? null : excerpt.toMap(),
//         "featured_media": featuredMedia == null ? null : featuredMedia.toMap(),
//         "tax_relation": taxRelation == null ? null : taxRelation.toMap(),
//         "categories": categories == null ? null : categories.toMap(),
//         "categories_exclude":
//             categoriesExclude == null ? null : categoriesExclude.toMap(),
//         "tags": tags == null ? null : tags.toMap(),
//         "tags_exclude": tagsExclude == null ? null : tagsExclude.toMap(),
//         "sticky": sticky == null ? null : sticky.toMap(),
//         "format": format == null ? null : format.toMap(),
//       };
// }

// class After {
//   After({
//     this.description,
//     this.type,
//     this.format,
//     this.required,
//   });

//   final String description;
//   final TypeElement type;
//   final Format format;
//   final bool required;

//   factory After.fromMap(Map<String, dynamic> json) => After(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         format:
//             json["format"] == null ? null : formatValues.map[json["format"]],
//         required: json["required"] == null ? null : json["required"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "format": format == null ? null : formatValues.reverse[format],
//         "required": required == null ? null : required,
//       };
// }

// class Categories {
//   Categories({
//     this.description,
//     this.type,
//     this.oneOf,
//     this.required,
//     this.items,
//   });

//   final String description;
//   final dynamic type;
//   final List<CategoriesOneOf> oneOf;
//   final bool required;
//   final OneOfItems items;

//   factory Categories.fromMap(Map<String, dynamic> json) => Categories(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"],
//         oneOf: json["oneOf"] == null
//             ? null
//             : List<CategoriesOneOf>.from(
//                 json["oneOf"].map((x) => CategoriesOneOf.fromMap(x))),
//         required: json["required"] == null ? null : json["required"],
//         items: json["items"] == null ? null : OneOfItems.fromMap(json["items"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type,
//         "oneOf": oneOf == null
//             ? null
//             : List<dynamic>.from(oneOf.map((x) => x.toMap())),
//         "required": required == null ? null : required,
//         "items": items == null ? null : items.toMap(),
//       };
// }

// class CategoriesOneOf {
//   CategoriesOneOf({
//     this.title,
//     this.description,
//     this.type,
//     this.items,
//     this.properties,
//     this.additionalProperties,
//   });

//   final String title;
//   final String description;
//   final TypeElement type;
//   final OneOfItems items;
//   final TentacledProperties properties;
//   final bool additionalProperties;

//   factory CategoriesOneOf.fromMap(Map<String, dynamic> json) => CategoriesOneOf(
//         title: json["title"] == null ? null : json["title"],
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         items: json["items"] == null ? null : OneOfItems.fromMap(json["items"]),
//         properties: json["properties"] == null
//             ? null
//             : TentacledProperties.fromMap(json["properties"]),
//         additionalProperties: json["additionalProperties"] == null
//             ? null
//             : json["additionalProperties"],
//       );

//   Map<String, dynamic> toMap() => {
//         "title": title == null ? null : title,
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "items": items == null ? null : items.toMap(),
//         "properties": properties == null ? null : properties.toMap(),
//         "additionalProperties":
//             additionalProperties == null ? null : additionalProperties,
//       };
// }

// class TentacledProperties {
//   TentacledProperties({
//     this.terms,
//     this.includeChildren,
//     this.propertiesOperator,
//   });

//   final TermValue terms;
//   final TermValue includeChildren;
//   final TermValue propertiesOperator;

//   factory TentacledProperties.fromMap(Map<String, dynamic> json) =>
//       TentacledProperties(
//         terms: json["terms"] == null ? null : TermValue.fromMap(json["terms"]),
//         includeChildren: json["include_children"] == null
//             ? null
//             : TermValue.fromMap(json["include_children"]),
//         propertiesOperator: json["operator"] == null
//             ? null
//             : TermValue.fromMap(json["operator"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "terms": terms == null ? null : terms.toMap(),
//         "include_children":
//             includeChildren == null ? null : includeChildren.toMap(),
//         "operator":
//             propertiesOperator == null ? null : propertiesOperator.toMap(),
//       };
// }

// class CommentStatus {
//   CommentStatus({
//     this.description,
//     this.type,
//     this.commentStatusEnum,
//     this.required,
//   });

//   final String description;
//   final TypeElement type;
//   final List<String> commentStatusEnum;
//   final bool required;

//   factory CommentStatus.fromMap(Map<String, dynamic> json) => CommentStatus(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         commentStatusEnum: json["enum"] == null
//             ? null
//             : List<String>.from(json["enum"].map((x) => x)),
//         required: json["required"] == null ? null : json["required"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "enum": commentStatusEnum == null
//             ? null
//             : List<dynamic>.from(commentStatusEnum.map((x) => x)),
//         "required": required == null ? null : required,
//       };
// }

// class Content {
//   Content({
//     this.description,
//     this.type,
//     this.properties,
//     this.required,
//   });

//   final ContentDescription description;
//   final TypeElement type;
//   final ContentPropertiesClass properties;
//   final bool required;

//   factory Content.fromMap(Map<String, dynamic> json) => Content(
//         description: json["description"] == null
//             ? null
//             : contentDescriptionValues.map[json["description"]],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         properties: json["properties"] == null
//             ? null
//             : ContentPropertiesClass.fromMap(json["properties"]),
//         required: json["required"] == null ? null : json["required"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null
//             ? null
//             : contentDescriptionValues.reverse[description],
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "properties": properties == null ? null : properties.toMap(),
//         "required": required == null ? null : required,
//       };
// }

// enum ContentDescription { EMPTY, DESCRIPTION }

// final contentDescriptionValues = EnumValues({
//   "Отрывок записи.": ContentDescription.DESCRIPTION,
//   "Содержимое записи.": ContentDescription.EMPTY
// });

// class Tags {
//   Tags({
//     this.description,
//     this.type,
//     this.oneOf,
//     this.required,
//     this.items,
//   });

//   final String description;
//   final dynamic type;
//   final List<TagsOneOf> oneOf;
//   final bool required;
//   final OneOfItems items;

//   factory Tags.fromMap(Map<String, dynamic> json) => Tags(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"],
//         oneOf: json["oneOf"] == null
//             ? null
//             : List<TagsOneOf>.from(
//                 json["oneOf"].map((x) => TagsOneOf.fromMap(x))),
//         required: json["required"] == null ? null : json["required"],
//         items: json["items"] == null ? null : OneOfItems.fromMap(json["items"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type,
//         "oneOf": oneOf == null
//             ? null
//             : List<dynamic>.from(oneOf.map((x) => x.toMap())),
//         "required": required == null ? null : required,
//         "items": items == null ? null : items.toMap(),
//       };
// }

// class TagsOneOf {
//   TagsOneOf({
//     this.title,
//     this.description,
//     this.type,
//     this.items,
//     this.properties,
//     this.additionalProperties,
//   });

//   final String title;
//   final String description;
//   final TypeElement type;
//   final OneOfItems items;
//   final StickyProperties properties;
//   final bool additionalProperties;

//   factory TagsOneOf.fromMap(Map<String, dynamic> json) => TagsOneOf(
//         title: json["title"] == null ? null : json["title"],
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         items: json["items"] == null ? null : OneOfItems.fromMap(json["items"]),
//         properties: json["properties"] == null
//             ? null
//             : StickyProperties.fromMap(json["properties"]),
//         additionalProperties: json["additionalProperties"] == null
//             ? null
//             : json["additionalProperties"],
//       );

//   Map<String, dynamic> toMap() => {
//         "title": title == null ? null : title,
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "items": items == null ? null : items.toMap(),
//         "properties": properties == null ? null : properties.toMap(),
//         "additionalProperties":
//             additionalProperties == null ? null : additionalProperties,
//       };
// }

// class StickyProperties {
//   StickyProperties({
//     this.terms,
//     this.propertiesOperator,
//   });

//   final StatusClass terms;
//   final StatusClass propertiesOperator;

//   factory StickyProperties.fromMap(Map<String, dynamic> json) =>
//       StickyProperties(
//         terms:
//             json["terms"] == null ? null : StatusClass.fromMap(json["terms"]),
//         propertiesOperator: json["operator"] == null
//             ? null
//             : StatusClass.fromMap(json["operator"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "terms": terms == null ? null : terms.toMap(),
//         "operator":
//             propertiesOperator == null ? null : propertiesOperator.toMap(),
//       };
// }

// class WpV2MediaPIdD {
//   WpV2MediaPIdD({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2MediaPIdDEndpoint> endpoints;

//   factory WpV2MediaPIdD.fromMap(Map<String, dynamic> json) => WpV2MediaPIdD(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2MediaPIdDEndpoint>.from(
//                 json["endpoints"].map((x) => WpV2MediaPIdDEndpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2MediaPIdDEndpoint {
//   WpV2MediaPIdDEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final Args1 args;

//   factory WpV2MediaPIdDEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2MediaPIdDEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null ? null : Args1.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args1 {
//   Args1({
//     this.id,
//     this.context,
//     this.date,
//     this.dateGmt,
//     this.slug,
//     this.status,
//     this.title,
//     this.author,
//     this.commentStatus,
//     this.pingStatus,
//     this.meta,
//     this.template,
//     this.altText,
//     this.caption,
//     this.description,
//     this.post,
//     this.force,
//   });

//   final StatusClass id;
//   final TermValue context;
//   final Date date;
//   final Date dateGmt;
//   final StatusClass slug;
//   final StatusClass status;
//   final StatusClass title;
//   final TermValue author;
//   final TermValue commentStatus;
//   final StatusClass pingStatus;
//   final StatusClass meta;
//   final StatusClass template;
//   final TermValue altText;
//   final TermValue caption;
//   final TermValue description;
//   final StatusClass post;
//   final StatusClass force;

//   factory Args1.fromMap(Map<String, dynamic> json) => Args1(
//         id: json["id"] == null ? null : StatusClass.fromMap(json["id"]),
//         context:
//             json["context"] == null ? null : TermValue.fromMap(json["context"]),
//         date: json["date"] == null ? null : Date.fromMap(json["date"]),
//         dateGmt:
//             json["date_gmt"] == null ? null : Date.fromMap(json["date_gmt"]),
//         slug: json["slug"] == null ? null : StatusClass.fromMap(json["slug"]),
//         status:
//             json["status"] == null ? null : StatusClass.fromMap(json["status"]),
//         title:
//             json["title"] == null ? null : StatusClass.fromMap(json["title"]),
//         author:
//             json["author"] == null ? null : TermValue.fromMap(json["author"]),
//         commentStatus: json["comment_status"] == null
//             ? null
//             : TermValue.fromMap(json["comment_status"]),
//         pingStatus: json["ping_status"] == null
//             ? null
//             : StatusClass.fromMap(json["ping_status"]),
//         meta: json["meta"] == null ? null : StatusClass.fromMap(json["meta"]),
//         template: json["template"] == null
//             ? null
//             : StatusClass.fromMap(json["template"]),
//         altText: json["alt_text"] == null
//             ? null
//             : TermValue.fromMap(json["alt_text"]),
//         caption:
//             json["caption"] == null ? null : TermValue.fromMap(json["caption"]),
//         description: json["description"] == null
//             ? null
//             : TermValue.fromMap(json["description"]),
//         post: json["post"] == null ? null : StatusClass.fromMap(json["post"]),
//         force:
//             json["force"] == null ? null : StatusClass.fromMap(json["force"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id.toMap(),
//         "context": context == null ? null : context.toMap(),
//         "date": date == null ? null : date.toMap(),
//         "date_gmt": dateGmt == null ? null : dateGmt.toMap(),
//         "slug": slug == null ? null : slug.toMap(),
//         "status": status == null ? null : status.toMap(),
//         "title": title == null ? null : title.toMap(),
//         "author": author == null ? null : author.toMap(),
//         "comment_status": commentStatus == null ? null : commentStatus.toMap(),
//         "ping_status": pingStatus == null ? null : pingStatus.toMap(),
//         "meta": meta == null ? null : meta.toMap(),
//         "template": template == null ? null : template.toMap(),
//         "alt_text": altText == null ? null : altText.toMap(),
//         "caption": caption == null ? null : caption.toMap(),
//         "description": description == null ? null : description.toMap(),
//         "post": post == null ? null : post.toMap(),
//         "force": force == null ? null : force.toMap(),
//       };
// }

// class WpV2MediaPIdDEdit {
//   WpV2MediaPIdDEdit({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2MediaPIdDEditEndpoint> endpoints;

//   factory WpV2MediaPIdDEdit.fromMap(Map<String, dynamic> json) =>
//       WpV2MediaPIdDEdit(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2MediaPIdDEditEndpoint>.from(json["endpoints"]
//                 .map((x) => WpV2MediaPIdDEditEndpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2MediaPIdDEditEndpoint {
//   WpV2MediaPIdDEditEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final Args2 args;

//   factory WpV2MediaPIdDEditEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2MediaPIdDEditEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null ? null : Args2.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args2 {
//   Args2({
//     this.src,
//     this.modifiers,
//     this.rotation,
//     this.x,
//     this.y,
//     this.width,
//     this.height,
//   });

//   final SrcValue src;
//   final Modifiers modifiers;
//   final Rotation rotation;
//   final SrcValue x;
//   final SrcValue y;
//   final SrcValue width;
//   final StatusClass height;

//   factory Args2.fromMap(Map<String, dynamic> json) => Args2(
//         src: json["src"] == null ? null : SrcValue.fromMap(json["src"]),
//         modifiers: json["modifiers"] == null
//             ? null
//             : Modifiers.fromMap(json["modifiers"]),
//         rotation: json["rotation"] == null
//             ? null
//             : Rotation.fromMap(json["rotation"]),
//         x: json["x"] == null ? null : SrcValue.fromMap(json["x"]),
//         y: json["y"] == null ? null : SrcValue.fromMap(json["y"]),
//         width: json["width"] == null ? null : SrcValue.fromMap(json["width"]),
//         height:
//             json["height"] == null ? null : StatusClass.fromMap(json["height"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "src": src == null ? null : src.toMap(),
//         "modifiers": modifiers == null ? null : modifiers.toMap(),
//         "rotation": rotation == null ? null : rotation.toMap(),
//         "x": x == null ? null : x.toMap(),
//         "y": y == null ? null : y.toMap(),
//         "width": width == null ? null : width.toMap(),
//         "height": height == null ? null : height.toMap(),
//       };
// }

// class Modifiers {
//   Modifiers({
//     this.description,
//     this.type,
//     this.minItems,
//     this.items,
//     this.required,
//   });

//   final String description;
//   final TypeElement type;
//   final int minItems;
//   final ArgsClass items;
//   final bool required;

//   factory Modifiers.fromMap(Map<String, dynamic> json) => Modifiers(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         minItems: json["minItems"] == null ? null : json["minItems"],
//         items: json["items"] == null ? null : ArgsClass.fromMap(json["items"]),
//         required: json["required"] == null ? null : json["required"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "minItems": minItems == null ? null : minItems,
//         "items": items == null ? null : items.toMap(),
//         "required": required == null ? null : required,
//       };
// }

// class IndigoProperties {
//   IndigoProperties({
//     this.type,
//     this.args,
//   });

//   final TermValue type;
//   final ArgsClass args;

//   factory IndigoProperties.fromMap(Map<String, dynamic> json) =>
//       IndigoProperties(
//         type: json["type"] == null ? null : TermValue.fromMap(json["type"]),
//         args: json["args"] == null ? null : ArgsClass.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "type": type == null ? null : type.toMap(),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class ItemsOneOf {
//   ItemsOneOf({
//     this.title,
//     this.properties,
//   });

//   final String title;
//   final IndigoProperties properties;

//   factory ItemsOneOf.fromMap(Map<String, dynamic> json) => ItemsOneOf(
//         title: json["title"] == null ? null : json["title"],
//         properties: json["properties"] == null
//             ? null
//             : IndigoProperties.fromMap(json["properties"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "title": title == null ? null : title,
//         "properties": properties == null ? null : properties.toMap(),
//       };
// }

// class ArgsClass {
//   ArgsClass({
//     this.description,
//     this.type,
//     this.required,
//     this.oneOf,
//     this.properties,
//   });

//   final String description;
//   final TypeElement type;
//   final List<String> required;
//   final List<ItemsOneOf> oneOf;
//   final ItemsProperties properties;

//   factory ArgsClass.fromMap(Map<String, dynamic> json) => ArgsClass(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         required: json["required"] == null
//             ? null
//             : List<String>.from(json["required"].map((x) => x)),
//         oneOf: json["oneOf"] == null
//             ? null
//             : List<ItemsOneOf>.from(
//                 json["oneOf"].map((x) => ItemsOneOf.fromMap(x))),
//         properties: json["properties"] == null
//             ? null
//             : ItemsProperties.fromMap(json["properties"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "required": required == null
//             ? null
//             : List<dynamic>.from(required.map((x) => x)),
//         "oneOf": oneOf == null
//             ? null
//             : List<dynamic>.from(oneOf.map((x) => x.toMap())),
//         "properties": properties == null ? null : properties.toMap(),
//       };
// }

// class ItemsProperties {
//   ItemsProperties({
//     this.angle,
//     this.left,
//     this.top,
//     this.width,
//     this.height,
//   });

//   final Angle angle;
//   final Angle left;
//   final Angle top;
//   final Angle width;
//   final Angle height;

//   factory ItemsProperties.fromMap(Map<String, dynamic> json) => ItemsProperties(
//         angle: json["angle"] == null ? null : Angle.fromMap(json["angle"]),
//         left: json["left"] == null ? null : Angle.fromMap(json["left"]),
//         top: json["top"] == null ? null : Angle.fromMap(json["top"]),
//         width: json["width"] == null ? null : Angle.fromMap(json["width"]),
//         height: json["height"] == null ? null : Angle.fromMap(json["height"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "angle": angle == null ? null : angle.toMap(),
//         "left": left == null ? null : left.toMap(),
//         "top": top == null ? null : top.toMap(),
//         "width": width == null ? null : width.toMap(),
//         "height": height == null ? null : height.toMap(),
//       };
// }

// class Angle {
//   Angle({
//     this.description,
//     this.type,
//   });

//   final String description;
//   final TypeElement type;

//   factory Angle.fromMap(Map<String, dynamic> json) => Angle(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//       };
// }

// class Rotation {
//   Rotation({
//     this.description,
//     this.type,
//     this.minimum,
//     this.exclusiveMinimum,
//     this.maximum,
//     this.exclusiveMaximum,
//     this.required,
//   });

//   final String description;
//   final TypeElement type;
//   final int minimum;
//   final bool exclusiveMinimum;
//   final int maximum;
//   final bool exclusiveMaximum;
//   final bool required;

//   factory Rotation.fromMap(Map<String, dynamic> json) => Rotation(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         minimum: json["minimum"] == null ? null : json["minimum"],
//         exclusiveMinimum:
//             json["exclusiveMinimum"] == null ? null : json["exclusiveMinimum"],
//         maximum: json["maximum"] == null ? null : json["maximum"],
//         exclusiveMaximum:
//             json["exclusiveMaximum"] == null ? null : json["exclusiveMaximum"],
//         required: json["required"] == null ? null : json["required"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "minimum": minimum == null ? null : minimum,
//         "exclusiveMinimum": exclusiveMinimum == null ? null : exclusiveMinimum,
//         "maximum": maximum == null ? null : maximum,
//         "exclusiveMaximum": exclusiveMaximum == null ? null : exclusiveMaximum,
//         "required": required == null ? null : required,
//       };
// }

// class WpV2MediaPIdDPostProcess {
//   WpV2MediaPIdDPostProcess({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2MediaPIdDPostProcessEndpoint> endpoints;

//   factory WpV2MediaPIdDPostProcess.fromMap(Map<String, dynamic> json) =>
//       WpV2MediaPIdDPostProcess(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2MediaPIdDPostProcessEndpoint>.from(json["endpoints"]
//                 .map((x) => WpV2MediaPIdDPostProcessEndpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2MediaPIdDPostProcessEndpoint {
//   WpV2MediaPIdDPostProcessEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final Args3 args;

//   factory WpV2MediaPIdDPostProcessEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2MediaPIdDPostProcessEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null ? null : Args3.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args3 {
//   Args3({
//     this.id,
//     this.action,
//   });

//   final StatusClass id;
//   final StatusClass action;

//   factory Args3.fromMap(Map<String, dynamic> json) => Args3(
//         id: json["id"] == null ? null : StatusClass.fromMap(json["id"]),
//         action:
//             json["action"] == null ? null : StatusClass.fromMap(json["action"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id.toMap(),
//         "action": action == null ? null : action.toMap(),
//       };
// }

// class WpV2P {
//   WpV2P({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2PagesPIdDEndpoint> endpoints;

//   factory WpV2P.fromMap(Map<String, dynamic> json) => WpV2P(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2PagesPIdDEndpoint>.from(
//                 json["endpoints"].map((x) => WpV2PagesPIdDEndpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2PagesPIdDEndpoint {
//   WpV2PagesPIdDEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final Args4 args;

//   factory WpV2PagesPIdDEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2PagesPIdDEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null ? null : Args4.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args4 {
//   Args4({
//     this.id,
//     this.context,
//     this.password,
//     this.date,
//     this.dateGmt,
//     this.slug,
//     this.status,
//     this.parent,
//     this.title,
//     this.content,
//     this.author,
//     this.excerpt,
//     this.featuredMedia,
//     this.commentStatus,
//     this.pingStatus,
//     this.menuOrder,
//     this.meta,
//     this.template,
//     this.force,
//     this.format,
//     this.sticky,
//     this.categories,
//     this.tags,
//   });

//   final Id id;
//   final PurpleContext context;
//   final Id password;
//   final Date date;
//   final Date dateGmt;
//   final Id slug;
//   final CommentStatus status;
//   final Id parent;
//   final Title title;
//   final Content content;
//   final Id author;
//   final Content excerpt;
//   final Id featuredMedia;
//   final CommentStatus commentStatus;
//   final CommentStatus pingStatus;
//   final Id menuOrder;
//   final Meta meta;
//   final Id template;
//   final Force force;
//   final CommentStatus format;
//   final Id sticky;
//   final TermValue categories;
//   final Slug tags;

//   factory Args4.fromMap(Map<String, dynamic> json) => Args4(
//         id: json["id"] == null ? null : Id.fromMap(json["id"]),
//         context: json["context"] == null
//             ? null
//             : PurpleContext.fromMap(json["context"]),
//         password:
//             json["password"] == null ? null : Id.fromMap(json["password"]),
//         date: json["date"] == null ? null : Date.fromMap(json["date"]),
//         dateGmt:
//             json["date_gmt"] == null ? null : Date.fromMap(json["date_gmt"]),
//         slug: json["slug"] == null ? null : Id.fromMap(json["slug"]),
//         status: json["status"] == null
//             ? null
//             : CommentStatus.fromMap(json["status"]),
//         parent: json["parent"] == null ? null : Id.fromMap(json["parent"]),
//         title: json["title"] == null ? null : Title.fromMap(json["title"]),
//         content:
//             json["content"] == null ? null : Content.fromMap(json["content"]),
//         author: json["author"] == null ? null : Id.fromMap(json["author"]),
//         excerpt:
//             json["excerpt"] == null ? null : Content.fromMap(json["excerpt"]),
//         featuredMedia: json["featured_media"] == null
//             ? null
//             : Id.fromMap(json["featured_media"]),
//         commentStatus: json["comment_status"] == null
//             ? null
//             : CommentStatus.fromMap(json["comment_status"]),
//         pingStatus: json["ping_status"] == null
//             ? null
//             : CommentStatus.fromMap(json["ping_status"]),
//         menuOrder:
//             json["menu_order"] == null ? null : Id.fromMap(json["menu_order"]),
//         meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
//         template:
//             json["template"] == null ? null : Id.fromMap(json["template"]),
//         force: json["force"] == null ? null : Force.fromMap(json["force"]),
//         format: json["format"] == null
//             ? null
//             : CommentStatus.fromMap(json["format"]),
//         sticky: json["sticky"] == null ? null : Id.fromMap(json["sticky"]),
//         categories: json["categories"] == null
//             ? null
//             : TermValue.fromMap(json["categories"]),
//         tags: json["tags"] == null ? null : Slug.fromMap(json["tags"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id.toMap(),
//         "context": context == null ? null : context.toMap(),
//         "password": password == null ? null : password.toMap(),
//         "date": date == null ? null : date.toMap(),
//         "date_gmt": dateGmt == null ? null : dateGmt.toMap(),
//         "slug": slug == null ? null : slug.toMap(),
//         "status": status == null ? null : status.toMap(),
//         "parent": parent == null ? null : parent.toMap(),
//         "title": title == null ? null : title.toMap(),
//         "content": content == null ? null : content.toMap(),
//         "author": author == null ? null : author.toMap(),
//         "excerpt": excerpt == null ? null : excerpt.toMap(),
//         "featured_media": featuredMedia == null ? null : featuredMedia.toMap(),
//         "comment_status": commentStatus == null ? null : commentStatus.toMap(),
//         "ping_status": pingStatus == null ? null : pingStatus.toMap(),
//         "menu_order": menuOrder == null ? null : menuOrder.toMap(),
//         "meta": meta == null ? null : meta.toMap(),
//         "template": template == null ? null : template.toMap(),
//         "force": force == null ? null : force.toMap(),
//         "format": format == null ? null : format.toMap(),
//         "sticky": sticky == null ? null : sticky.toMap(),
//         "categories": categories == null ? null : categories.toMap(),
//         "tags": tags == null ? null : tags.toMap(),
//       };
// }

// class Title {
//   Title({
//     this.description,
//     this.type,
//     this.properties,
//     this.required,
//   });

//   final String description;
//   final TypeElement type;
//   final TitlePropertiesClass properties;
//   final bool required;

//   factory Title.fromMap(Map<String, dynamic> json) => Title(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         properties: json["properties"] == null
//             ? null
//             : TitlePropertiesClass.fromMap(json["properties"]),
//         required: json["required"] == null ? null : json["required"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "properties": properties == null ? null : properties.toMap(),
//         "required": required == null ? null : required,
//       };
// }

// class TitlePropertiesClass {
//   TitlePropertiesClass({
//     this.raw,
//     this.rendered,
//   });

//   final BlockVersion raw;
//   final BlockVersion rendered;

//   factory TitlePropertiesClass.fromMap(Map<String, dynamic> json) =>
//       TitlePropertiesClass(
//         raw: json["raw"] == null ? null : BlockVersion.fromMap(json["raw"]),
//         rendered: json["rendered"] == null
//             ? null
//             : BlockVersion.fromMap(json["rendered"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "raw": raw == null ? null : raw.toMap(),
//         "rendered": rendered == null ? null : rendered.toMap(),
//       };
// }

// class WpV2PatternDirectoryPatterns {
//   WpV2PatternDirectoryPatterns({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//     this.links,
//   });

//   final String namespace;
//   final List<Method> methods;
//   final List<WpV2PatternDirectoryPatternsEndpoint> endpoints;
//   final WpV2Links links;

//   factory WpV2PatternDirectoryPatterns.fromMap(Map<String, dynamic> json) =>
//       WpV2PatternDirectoryPatterns(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2PatternDirectoryPatternsEndpoint>.from(json["endpoints"]
//                 .map((x) => WpV2PatternDirectoryPatternsEndpoint.fromMap(x))),
//         links:
//             json["_links"] == null ? null : WpV2Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//         "_links": links == null ? null : links.toMap(),
//       };
// }

// class WpV2PatternDirectoryPatternsEndpoint {
//   WpV2PatternDirectoryPatternsEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<Method> methods;
//   final Args5 args;

//   factory WpV2PatternDirectoryPatternsEndpoint.fromMap(
//           Map<String, dynamic> json) =>
//       WpV2PatternDirectoryPatternsEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         args: json["args"] == null ? null : Args5.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args5 {
//   Args5({
//     this.context,
//     this.search,
//     this.category,
//     this.keyword,
//   });

//   final TermValue context;
//   final TermValue search;
//   final TermValue category;
//   final TermValue keyword;

//   factory Args5.fromMap(Map<String, dynamic> json) => Args5(
//         context:
//             json["context"] == null ? null : TermValue.fromMap(json["context"]),
//         search:
//             json["search"] == null ? null : TermValue.fromMap(json["search"]),
//         category: json["category"] == null
//             ? null
//             : TermValue.fromMap(json["category"]),
//         keyword:
//             json["keyword"] == null ? null : TermValue.fromMap(json["keyword"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "context": context == null ? null : context.toMap(),
//         "search": search == null ? null : search.toMap(),
//         "category": category == null ? null : category.toMap(),
//         "keyword": keyword == null ? null : keyword.toMap(),
//       };
// }

// class WpV2Plugins {
//   WpV2Plugins({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//     this.links,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2PluginsEndpoint> endpoints;
//   final WpV2Links links;

//   factory WpV2Plugins.fromMap(Map<String, dynamic> json) => WpV2Plugins(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2PluginsEndpoint>.from(
//                 json["endpoints"].map((x) => WpV2PluginsEndpoint.fromMap(x))),
//         links:
//             json["_links"] == null ? null : WpV2Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//         "_links": links == null ? null : links.toMap(),
//       };
// }

// class WpV2PluginsEndpoint {
//   WpV2PluginsEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final Args6 args;

//   factory WpV2PluginsEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2PluginsEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null ? null : Args6.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args6 {
//   Args6({
//     this.context,
//     this.search,
//     this.status,
//     this.slug,
//   });

//   final SrcValue context;
//   final SrcValue search;
//   final SrcValue status;
//   final SrcValue slug;

//   factory Args6.fromMap(Map<String, dynamic> json) => Args6(
//         context:
//             json["context"] == null ? null : SrcValue.fromMap(json["context"]),
//         search:
//             json["search"] == null ? null : SrcValue.fromMap(json["search"]),
//         status:
//             json["status"] == null ? null : SrcValue.fromMap(json["status"]),
//         slug: json["slug"] == null ? null : SrcValue.fromMap(json["slug"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "context": context == null ? null : context.toMap(),
//         "search": search == null ? null : search.toMap(),
//         "status": status == null ? null : status.toMap(),
//         "slug": slug == null ? null : slug.toMap(),
//       };
// }

// class WpV2PluginsPPlugin {
//   WpV2PluginsPPlugin({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2PluginsPPluginEndpoint> endpoints;

//   factory WpV2PluginsPPlugin.fromMap(Map<String, dynamic> json) =>
//       WpV2PluginsPPlugin(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2PluginsPPluginEndpoint>.from(json["endpoints"]
//                 .map((x) => WpV2PluginsPPluginEndpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2PluginsPPluginEndpoint {
//   WpV2PluginsPPluginEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final Args7 args;

//   factory WpV2PluginsPPluginEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2PluginsPPluginEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null ? null : Args7.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args7 {
//   Args7({
//     this.context,
//     this.plugin,
//     this.status,
//   });

//   final SrcValue context;
//   final SrcValue plugin;
//   final SrcValue status;

//   factory Args7.fromMap(Map<String, dynamic> json) => Args7(
//         context:
//             json["context"] == null ? null : SrcValue.fromMap(json["context"]),
//         plugin:
//             json["plugin"] == null ? null : SrcValue.fromMap(json["plugin"]),
//         status:
//             json["status"] == null ? null : SrcValue.fromMap(json["status"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "context": context == null ? null : context.toMap(),
//         "plugin": plugin == null ? null : plugin.toMap(),
//         "status": status == null ? null : status.toMap(),
//       };
// }

// class WpV2Search {
//   WpV2Search({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//     this.links,
//   });

//   final String namespace;
//   final List<Method> methods;
//   final List<WpV2SearchEndpoint> endpoints;
//   final WpV2Links links;

//   factory WpV2Search.fromMap(Map<String, dynamic> json) => WpV2Search(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2SearchEndpoint>.from(
//                 json["endpoints"].map((x) => WpV2SearchEndpoint.fromMap(x))),
//         links:
//             json["_links"] == null ? null : WpV2Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//         "_links": links == null ? null : links.toMap(),
//       };
// }

// class WpV2SearchEndpoint {
//   WpV2SearchEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<Method> methods;
//   final Args8 args;

//   factory WpV2SearchEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2SearchEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         args: json["args"] == null ? null : Args8.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args8 {
//   Args8({
//     this.context,
//     this.page,
//     this.perPage,
//     this.search,
//     this.type,
//     this.subtype,
//   });

//   final StatusClass context;
//   final StatusClass page;
//   final StatusClass perPage;
//   final StatusClass search;
//   final StatusClass type;
//   final StatusClass subtype;

//   factory Args8.fromMap(Map<String, dynamic> json) => Args8(
//         context: json["context"] == null
//             ? null
//             : StatusClass.fromMap(json["context"]),
//         page: json["page"] == null ? null : StatusClass.fromMap(json["page"]),
//         perPage: json["per_page"] == null
//             ? null
//             : StatusClass.fromMap(json["per_page"]),
//         search:
//             json["search"] == null ? null : StatusClass.fromMap(json["search"]),
//         type: json["type"] == null ? null : StatusClass.fromMap(json["type"]),
//         subtype: json["subtype"] == null
//             ? null
//             : StatusClass.fromMap(json["subtype"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "context": context == null ? null : context.toMap(),
//         "page": page == null ? null : page.toMap(),
//         "per_page": perPage == null ? null : perPage.toMap(),
//         "search": search == null ? null : search.toMap(),
//         "type": type == null ? null : type.toMap(),
//         "subtype": subtype == null ? null : subtype.toMap(),
//       };
// }

// class WpV2Settings {
//   WpV2Settings({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//     this.links,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2SettingsEndpoint> endpoints;
//   final WpV2Links links;

//   factory WpV2Settings.fromMap(Map<String, dynamic> json) => WpV2Settings(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2SettingsEndpoint>.from(
//                 json["endpoints"].map((x) => WpV2SettingsEndpoint.fromMap(x))),
//         links:
//             json["_links"] == null ? null : WpV2Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//         "_links": links == null ? null : links.toMap(),
//       };
// }

// class WpV2SettingsEndpoint {
//   WpV2SettingsEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final dynamic args;

//   factory WpV2SettingsEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2SettingsEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"],
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args,
//       };
// }

// class WpV2SidebarsClass {
//   WpV2SidebarsClass({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//     this.links,
//   });

//   final String namespace;
//   final List<Method> methods;
//   final List<WpV2SidebarsEndpoint> endpoints;
//   final WpV2Links links;

//   factory WpV2SidebarsClass.fromMap(Map<String, dynamic> json) =>
//       WpV2SidebarsClass(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2SidebarsEndpoint>.from(
//                 json["endpoints"].map((x) => WpV2SidebarsEndpoint.fromMap(x))),
//         links:
//             json["_links"] == null ? null : WpV2Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//         "_links": links == null ? null : links.toMap(),
//       };
// }

// class WpV2SidebarsEndpoint {
//   WpV2SidebarsEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<Method> methods;
//   final Args9 args;

//   factory WpV2SidebarsEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2SidebarsEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         args: json["args"] == null ? null : Args9.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args9 {
//   Args9({
//     this.context,
//   });

//   final PurpleContext context;

//   factory Args9.fromMap(Map<String, dynamic> json) => Args9(
//         context: json["context"] == null
//             ? null
//             : PurpleContext.fromMap(json["context"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "context": context == null ? null : context.toMap(),
//       };
// }

// class WpV2SidebarsPIdW {
//   WpV2SidebarsPIdW({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2SidebarsPIdWEndpoint> endpoints;

//   factory WpV2SidebarsPIdW.fromMap(Map<String, dynamic> json) =>
//       WpV2SidebarsPIdW(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2SidebarsPIdWEndpoint>.from(json["endpoints"]
//                 .map((x) => WpV2SidebarsPIdWEndpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2SidebarsPIdWEndpoint {
//   WpV2SidebarsPIdWEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final Args10 args;

//   factory WpV2SidebarsPIdWEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2SidebarsPIdWEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null ? null : Args10.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args10 {
//   Args10({
//     this.id,
//     this.context,
//     this.widgets,
//   });

//   final StatusClass id;
//   final StatusClass context;
//   final StatusClass widgets;

//   factory Args10.fromMap(Map<String, dynamic> json) => Args10(
//         id: json["id"] == null ? null : StatusClass.fromMap(json["id"]),
//         context: json["context"] == null
//             ? null
//             : StatusClass.fromMap(json["context"]),
//         widgets: json["widgets"] == null
//             ? null
//             : StatusClass.fromMap(json["widgets"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id.toMap(),
//         "context": context == null ? null : context.toMap(),
//         "widgets": widgets == null ? null : widgets.toMap(),
//       };
// }

// class WpV2StatusesPStatusW {
//   WpV2StatusesPStatusW({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<Method> methods;
//   final List<WpV2StatusesPStatusWEndpoint> endpoints;

//   factory WpV2StatusesPStatusW.fromMap(Map<String, dynamic> json) =>
//       WpV2StatusesPStatusW(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2StatusesPStatusWEndpoint>.from(json["endpoints"]
//                 .map((x) => WpV2StatusesPStatusWEndpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2StatusesPStatusWEndpoint {
//   WpV2StatusesPStatusWEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<Method> methods;
//   final Args11 args;

//   factory WpV2StatusesPStatusWEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2StatusesPStatusWEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         args: json["args"] == null ? null : Args11.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args11 {
//   Args11({
//     this.status,
//     this.context,
//   });

//   final SrcValue status;
//   final SrcValue context;

//   factory Args11.fromMap(Map<String, dynamic> json) => Args11(
//         status:
//             json["status"] == null ? null : SrcValue.fromMap(json["status"]),
//         context:
//             json["context"] == null ? null : SrcValue.fromMap(json["context"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "status": status == null ? null : status.toMap(),
//         "context": context == null ? null : context.toMap(),
//       };
// }

// class WpV2T {
//   WpV2T({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//     this.links,
//   });

//   final String namespace;
//   final List<Method> methods;
//   final List<WpV2TaxonomiesEndpoint> endpoints;
//   final WpV2Links links;

//   factory WpV2T.fromMap(Map<String, dynamic> json) => WpV2T(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2TaxonomiesEndpoint>.from(json["endpoints"]
//                 .map((x) => WpV2TaxonomiesEndpoint.fromMap(x))),
//         links:
//             json["_links"] == null ? null : WpV2Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//         "_links": links == null ? null : links.toMap(),
//       };
// }

// class WpV2TaxonomiesEndpoint {
//   WpV2TaxonomiesEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<Method> methods;
//   final Args12 args;

//   factory WpV2TaxonomiesEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2TaxonomiesEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         args: json["args"] == null ? null : Args12.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args12 {
//   Args12({
//     this.context,
//     this.type,
//   });

//   final PurpleContext context;
//   final Id type;

//   factory Args12.fromMap(Map<String, dynamic> json) => Args12(
//         context: json["context"] == null
//             ? null
//             : PurpleContext.fromMap(json["context"]),
//         type: json["type"] == null ? null : Id.fromMap(json["type"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "context": context == null ? null : context.toMap(),
//         "type": type == null ? null : type.toMap(),
//       };
// }

// class WpV2TaxonomiesPTaxonomyW {
//   WpV2TaxonomiesPTaxonomyW({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<Method> methods;
//   final List<WpV2TaxonomiesPTaxonomyWEndpoint> endpoints;

//   factory WpV2TaxonomiesPTaxonomyW.fromMap(Map<String, dynamic> json) =>
//       WpV2TaxonomiesPTaxonomyW(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2TaxonomiesPTaxonomyWEndpoint>.from(json["endpoints"]
//                 .map((x) => WpV2TaxonomiesPTaxonomyWEndpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2TaxonomiesPTaxonomyWEndpoint {
//   WpV2TaxonomiesPTaxonomyWEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<Method> methods;
//   final Args13 args;

//   factory WpV2TaxonomiesPTaxonomyWEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2TaxonomiesPTaxonomyWEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         args: json["args"] == null ? null : Args13.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args13 {
//   Args13({
//     this.taxonomy,
//     this.context,
//   });

//   final SrcValue taxonomy;
//   final SrcValue context;

//   factory Args13.fromMap(Map<String, dynamic> json) => Args13(
//         taxonomy: json["taxonomy"] == null
//             ? null
//             : SrcValue.fromMap(json["taxonomy"]),
//         context:
//             json["context"] == null ? null : SrcValue.fromMap(json["context"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "taxonomy": taxonomy == null ? null : taxonomy.toMap(),
//         "context": context == null ? null : context.toMap(),
//       };
// }

// class WpV2Templates {
//   WpV2Templates({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//     this.links,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2TemplatesEndpoint> endpoints;
//   final WpV2Links links;

//   factory WpV2Templates.fromMap(Map<String, dynamic> json) => WpV2Templates(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2TemplatesEndpoint>.from(
//                 json["endpoints"].map((x) => WpV2TemplatesEndpoint.fromMap(x))),
//         links:
//             json["_links"] == null ? null : WpV2Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//         "_links": links == null ? null : links.toMap(),
//       };
// }

// class WpV2TemplatesEndpoint {
//   WpV2TemplatesEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final Args14 args;

//   factory WpV2TemplatesEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2TemplatesEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null ? null : Args14.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args14 {
//   Args14({
//     this.context,
//     this.wpId,
//     this.slug,
//     this.theme,
//     this.content,
//     this.title,
//     this.description,
//     this.status,
//   });

//   final StatusClass context;
//   final TermValue wpId;
//   final TermValue slug;
//   final TermValue theme;
//   final Date content;
//   final Date title;
//   final StatusClass description;
//   final TermValue status;

//   factory Args14.fromMap(Map<String, dynamic> json) => Args14(
//         context: json["context"] == null
//             ? null
//             : StatusClass.fromMap(json["context"]),
//         wpId: json["wp_id"] == null ? null : TermValue.fromMap(json["wp_id"]),
//         slug: json["slug"] == null ? null : TermValue.fromMap(json["slug"]),
//         theme: json["theme"] == null ? null : TermValue.fromMap(json["theme"]),
//         content: json["content"] == null ? null : Date.fromMap(json["content"]),
//         title: json["title"] == null ? null : Date.fromMap(json["title"]),
//         description: json["description"] == null
//             ? null
//             : StatusClass.fromMap(json["description"]),
//         status:
//             json["status"] == null ? null : TermValue.fromMap(json["status"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "context": context == null ? null : context.toMap(),
//         "wp_id": wpId == null ? null : wpId.toMap(),
//         "slug": slug == null ? null : slug.toMap(),
//         "theme": theme == null ? null : theme.toMap(),
//         "content": content == null ? null : content.toMap(),
//         "title": title == null ? null : title.toMap(),
//         "description": description == null ? null : description.toMap(),
//         "status": status == null ? null : status.toMap(),
//       };
// }

// class WpV2TemplatesPId {
//   WpV2TemplatesPId({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2TemplatesPIdWEndpoint> endpoints;

//   factory WpV2TemplatesPId.fromMap(Map<String, dynamic> json) =>
//       WpV2TemplatesPId(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2TemplatesPIdWEndpoint>.from(json["endpoints"]
//                 .map((x) => WpV2TemplatesPIdWEndpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2TemplatesPIdWEndpoint {
//   WpV2TemplatesPIdWEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final Args15 args;

//   factory WpV2TemplatesPIdWEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2TemplatesPIdWEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null ? null : Args15.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args15 {
//   Args15({
//     this.id,
//     this.slug,
//     this.theme,
//     this.content,
//     this.title,
//     this.description,
//     this.status,
//     this.force,
//     this.parent,
//     this.context,
//   });

//   final StatusClass id;
//   final SrcValue slug;
//   final SrcValue theme;
//   final Date content;
//   final Date title;
//   final Id description;
//   final SrcValue status;
//   final StatusClass force;
//   final SrcValue parent;
//   final SrcValue context;

//   factory Args15.fromMap(Map<String, dynamic> json) => Args15(
//         id: json["id"] == null ? null : StatusClass.fromMap(json["id"]),
//         slug: json["slug"] == null ? null : SrcValue.fromMap(json["slug"]),
//         theme: json["theme"] == null ? null : SrcValue.fromMap(json["theme"]),
//         content: json["content"] == null ? null : Date.fromMap(json["content"]),
//         title: json["title"] == null ? null : Date.fromMap(json["title"]),
//         description: json["description"] == null
//             ? null
//             : Id.fromMap(json["description"]),
//         status:
//             json["status"] == null ? null : SrcValue.fromMap(json["status"]),
//         force:
//             json["force"] == null ? null : StatusClass.fromMap(json["force"]),
//         parent:
//             json["parent"] == null ? null : SrcValue.fromMap(json["parent"]),
//         context:
//             json["context"] == null ? null : SrcValue.fromMap(json["context"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id.toMap(),
//         "slug": slug == null ? null : slug.toMap(),
//         "theme": theme == null ? null : theme.toMap(),
//         "content": content == null ? null : content.toMap(),
//         "title": title == null ? null : title.toMap(),
//         "description": description == null ? null : description.toMap(),
//         "status": status == null ? null : status.toMap(),
//         "force": force == null ? null : force.toMap(),
//         "parent": parent == null ? null : parent.toMap(),
//         "context": context == null ? null : context.toMap(),
//       };
// }

// class WpV2Themes {
//   WpV2Themes({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//     this.links,
//   });

//   final String namespace;
//   final List<Method> methods;
//   final List<WpV2ThemesEndpoint> endpoints;
//   final WpV2Links links;

//   factory WpV2Themes.fromMap(Map<String, dynamic> json) => WpV2Themes(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2ThemesEndpoint>.from(
//                 json["endpoints"].map((x) => WpV2ThemesEndpoint.fromMap(x))),
//         links:
//             json["_links"] == null ? null : WpV2Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//         "_links": links == null ? null : links.toMap(),
//       };
// }

// class WpV2ThemesEndpoint {
//   WpV2ThemesEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<Method> methods;
//   final Args16 args;

//   factory WpV2ThemesEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2ThemesEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         args: json["args"] == null ? null : Args16.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args16 {
//   Args16({
//     this.status,
//   });

//   final StatusClass status;

//   factory Args16.fromMap(Map<String, dynamic> json) => Args16(
//         status:
//             json["status"] == null ? null : StatusClass.fromMap(json["status"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "status": status == null ? null : status.toMap(),
//       };
// }

// class WpV2ThemesPStylesheetW {
//   WpV2ThemesPStylesheetW({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<Method> methods;
//   final List<WpV2ThemesPStylesheetWEndpoint> endpoints;

//   factory WpV2ThemesPStylesheetW.fromMap(Map<String, dynamic> json) =>
//       WpV2ThemesPStylesheetW(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2ThemesPStylesheetWEndpoint>.from(json["endpoints"]
//                 .map((x) => WpV2ThemesPStylesheetWEndpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2ThemesPStylesheetWEndpoint {
//   WpV2ThemesPStylesheetWEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<Method> methods;
//   final Args17 args;

//   factory WpV2ThemesPStylesheetWEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2ThemesPStylesheetWEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         args: json["args"] == null ? null : Args17.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args17 {
//   Args17({
//     this.stylesheet,
//   });

//   final StatusClass stylesheet;

//   factory Args17.fromMap(Map<String, dynamic> json) => Args17(
//         stylesheet: json["stylesheet"] == null
//             ? null
//             : StatusClass.fromMap(json["stylesheet"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "stylesheet": stylesheet == null ? null : stylesheet.toMap(),
//       };
// }

// class WpV2Users {
//   WpV2Users({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//     this.links,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2UsersEndpoint> endpoints;
//   final WpV2Links links;

//   factory WpV2Users.fromMap(Map<String, dynamic> json) => WpV2Users(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2UsersEndpoint>.from(
//                 json["endpoints"].map((x) => WpV2UsersEndpoint.fromMap(x))),
//         links:
//             json["_links"] == null ? null : WpV2Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//         "_links": links == null ? null : links.toMap(),
//       };
// }

// class WpV2UsersEndpoint {
//   WpV2UsersEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final Map<String, TermValue> args;

//   factory WpV2UsersEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2UsersEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null
//             ? null
//             : Map.from(json["args"]).map(
//                 (k, v) => MapEntry<String, TermValue>(k, TermValue.fromMap(v))),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null
//             ? null
//             : Map.from(args)
//                 .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
//       };
// }

// class WpV2UsersMe {
//   WpV2UsersMe({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//     this.links,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2UsersPIdDEndpoint> endpoints;
//   final WpV2Links links;

//   factory WpV2UsersMe.fromMap(Map<String, dynamic> json) => WpV2UsersMe(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2UsersPIdDEndpoint>.from(
//                 json["endpoints"].map((x) => WpV2UsersPIdDEndpoint.fromMap(x))),
//         links:
//             json["_links"] == null ? null : WpV2Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//         "_links": links == null ? null : links.toMap(),
//       };
// }

// class WpV2UsersPIdDEndpoint {
//   WpV2UsersPIdDEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final Args18 args;

//   factory WpV2UsersPIdDEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2UsersPIdDEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null ? null : Args18.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args18 {
//   Args18({
//     this.id,
//     this.context,
//     this.username,
//     this.name,
//     this.firstName,
//     this.lastName,
//     this.email,
//     this.url,
//     this.description,
//     this.locale,
//     this.nickname,
//     this.slug,
//     this.roles,
//     this.password,
//     this.meta,
//     this.force,
//     this.reassign,
//   });

//   final SrcValue id;
//   final PurpleContext context;
//   final Id username;
//   final Id name;
//   final Id firstName;
//   final Id lastName;
//   final After email;
//   final After url;
//   final Id description;
//   final CommentStatus locale;
//   final Id nickname;
//   final Id slug;
//   final Slug roles;
//   final Id password;
//   final Meta meta;
//   final Force force;
//   final Id reassign;

//   factory Args18.fromMap(Map<String, dynamic> json) => Args18(
//         id: json["id"] == null ? null : SrcValue.fromMap(json["id"]),
//         context: json["context"] == null
//             ? null
//             : PurpleContext.fromMap(json["context"]),
//         username:
//             json["username"] == null ? null : Id.fromMap(json["username"]),
//         name: json["name"] == null ? null : Id.fromMap(json["name"]),
//         firstName:
//             json["first_name"] == null ? null : Id.fromMap(json["first_name"]),
//         lastName:
//             json["last_name"] == null ? null : Id.fromMap(json["last_name"]),
//         email: json["email"] == null ? null : After.fromMap(json["email"]),
//         url: json["url"] == null ? null : After.fromMap(json["url"]),
//         description: json["description"] == null
//             ? null
//             : Id.fromMap(json["description"]),
//         locale: json["locale"] == null
//             ? null
//             : CommentStatus.fromMap(json["locale"]),
//         nickname:
//             json["nickname"] == null ? null : Id.fromMap(json["nickname"]),
//         slug: json["slug"] == null ? null : Id.fromMap(json["slug"]),
//         roles: json["roles"] == null ? null : Slug.fromMap(json["roles"]),
//         password:
//             json["password"] == null ? null : Id.fromMap(json["password"]),
//         meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
//         force: json["force"] == null ? null : Force.fromMap(json["force"]),
//         reassign:
//             json["reassign"] == null ? null : Id.fromMap(json["reassign"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id.toMap(),
//         "context": context == null ? null : context.toMap(),
//         "username": username == null ? null : username.toMap(),
//         "name": name == null ? null : name.toMap(),
//         "first_name": firstName == null ? null : firstName.toMap(),
//         "last_name": lastName == null ? null : lastName.toMap(),
//         "email": email == null ? null : email.toMap(),
//         "url": url == null ? null : url.toMap(),
//         "description": description == null ? null : description.toMap(),
//         "locale": locale == null ? null : locale.toMap(),
//         "nickname": nickname == null ? null : nickname.toMap(),
//         "slug": slug == null ? null : slug.toMap(),
//         "roles": roles == null ? null : roles.toMap(),
//         "password": password == null ? null : password.toMap(),
//         "meta": meta == null ? null : meta.toMap(),
//         "force": force == null ? null : force.toMap(),
//         "reassign": reassign == null ? null : reassign.toMap(),
//       };
// }

// class WpV2UsersPIdD {
//   WpV2UsersPIdD({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2UsersPIdDEndpoint> endpoints;

//   factory WpV2UsersPIdD.fromMap(Map<String, dynamic> json) => WpV2UsersPIdD(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2UsersPIdDEndpoint>.from(
//                 json["endpoints"].map((x) => WpV2UsersPIdDEndpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2UsersPUserIdDMeApplicationPasswords {
//   WpV2UsersPUserIdDMeApplicationPasswords({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2UsersPUserIdDMeApplicationPasswordsEndpoint> endpoints;

//   factory WpV2UsersPUserIdDMeApplicationPasswords.fromMap(
//           Map<String, dynamic> json) =>
//       WpV2UsersPUserIdDMeApplicationPasswords(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2UsersPUserIdDMeApplicationPasswordsEndpoint>.from(
//                 json["endpoints"].map((x) =>
//                     WpV2UsersPUserIdDMeApplicationPasswordsEndpoint.fromMap(
//                         x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2UsersPUserIdDMeApplicationPasswordsEndpoint {
//   WpV2UsersPUserIdDMeApplicationPasswordsEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final dynamic args;

//   factory WpV2UsersPUserIdDMeApplicationPasswordsEndpoint.fromMap(
//           Map<String, dynamic> json) =>
//       WpV2UsersPUserIdDMeApplicationPasswordsEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"],
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args,
//       };
// }

// class ArgsArgs {
//   ArgsArgs({
//     this.context,
//     this.appId,
//     this.name,
//   });

//   final StatusClass context;
//   final StatusClass appId;
//   final Name name;

//   factory ArgsArgs.fromMap(Map<String, dynamic> json) => ArgsArgs(
//         context: json["context"] == null
//             ? null
//             : StatusClass.fromMap(json["context"]),
//         appId:
//             json["app_id"] == null ? null : StatusClass.fromMap(json["app_id"]),
//         name: json["name"] == null ? null : Name.fromMap(json["name"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "context": context == null ? null : context.toMap(),
//         "app_id": appId == null ? null : appId.toMap(),
//         "name": name == null ? null : name.toMap(),
//       };
// }

// class Name {
//   Name({
//     this.description,
//     this.type,
//     this.minLength,
//     this.pattern,
//     this.required,
//   });

//   final String description;
//   final TypeElement type;
//   final int minLength;
//   final String pattern;
//   final bool required;

//   factory Name.fromMap(Map<String, dynamic> json) => Name(
//         description: json["description"] == null ? null : json["description"],
//         type: json["type"] == null ? null : typeElementValues.map[json["type"]],
//         minLength: json["minLength"] == null ? null : json["minLength"],
//         pattern: json["pattern"] == null ? null : json["pattern"],
//         required: json["required"] == null ? null : json["required"],
//       );

//   Map<String, dynamic> toMap() => {
//         "description": description == null ? null : description,
//         "type": type == null ? null : typeElementValues.reverse[type],
//         "minLength": minLength == null ? null : minLength,
//         "pattern": pattern == null ? null : pattern,
//         "required": required == null ? null : required,
//       };
// }

// class WpV2WidgetTypesPIdAZAZ09 {
//   WpV2WidgetTypesPIdAZAZ09({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<Method> methods;
//   final List<WpV2WidgetTypesPIdAZAZ09Endpoint> endpoints;

//   factory WpV2WidgetTypesPIdAZAZ09.fromMap(Map<String, dynamic> json) =>
//       WpV2WidgetTypesPIdAZAZ09(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2WidgetTypesPIdAZAZ09Endpoint>.from(json["endpoints"]
//                 .map((x) => WpV2WidgetTypesPIdAZAZ09Endpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2WidgetTypesPIdAZAZ09Endpoint {
//   WpV2WidgetTypesPIdAZAZ09Endpoint({
//     this.methods,
//     this.args,
//   });

//   final List<Method> methods;
//   final Args19 args;

//   factory WpV2WidgetTypesPIdAZAZ09Endpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2WidgetTypesPIdAZAZ09Endpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<Method>.from(
//                 json["methods"].map((x) => methodValues.map[x])),
//         args: json["args"] == null ? null : Args19.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods": methods == null
//             ? null
//             : List<dynamic>.from(methods.map((x) => methodValues.reverse[x])),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args19 {
//   Args19({
//     this.id,
//     this.context,
//   });

//   final TermValue id;
//   final TermValue context;

//   factory Args19.fromMap(Map<String, dynamic> json) => Args19(
//         id: json["id"] == null ? null : TermValue.fromMap(json["id"]),
//         context:
//             json["context"] == null ? null : TermValue.fromMap(json["context"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id.toMap(),
//         "context": context == null ? null : context.toMap(),
//       };
// }

// class WpV2WidgetTypesPIdAZAZ09Encode {
//   WpV2WidgetTypesPIdAZAZ09Encode({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2WidgetTypesPIdAZAZ09EncodeEndpoint> endpoints;

//   factory WpV2WidgetTypesPIdAZAZ09Encode.fromMap(Map<String, dynamic> json) =>
//       WpV2WidgetTypesPIdAZAZ09Encode(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2WidgetTypesPIdAZAZ09EncodeEndpoint>.from(
//                 json["endpoints"].map(
//                     (x) => WpV2WidgetTypesPIdAZAZ09EncodeEndpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2WidgetTypesPIdAZAZ09EncodeEndpoint {
//   WpV2WidgetTypesPIdAZAZ09EncodeEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final Args20 args;

//   factory WpV2WidgetTypesPIdAZAZ09EncodeEndpoint.fromMap(
//           Map<String, dynamic> json) =>
//       WpV2WidgetTypesPIdAZAZ09EncodeEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null ? null : Args20.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args20 {
//   Args20({
//     this.id,
//     this.instance,
//     this.formData,
//   });

//   final SrcValue id;
//   final SrcValue instance;
//   final SrcValue formData;

//   factory Args20.fromMap(Map<String, dynamic> json) => Args20(
//         id: json["id"] == null ? null : SrcValue.fromMap(json["id"]),
//         instance: json["instance"] == null
//             ? null
//             : SrcValue.fromMap(json["instance"]),
//         formData: json["form_data"] == null
//             ? null
//             : SrcValue.fromMap(json["form_data"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id.toMap(),
//         "instance": instance == null ? null : instance.toMap(),
//         "form_data": formData == null ? null : formData.toMap(),
//       };
// }

// class WpV2Widgets {
//   WpV2Widgets({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//     this.links,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2WidgetsEndpoint> endpoints;
//   final WpV2Links links;

//   factory WpV2Widgets.fromMap(Map<String, dynamic> json) => WpV2Widgets(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2WidgetsEndpoint>.from(
//                 json["endpoints"].map((x) => WpV2WidgetsEndpoint.fromMap(x))),
//         links:
//             json["_links"] == null ? null : WpV2Links.fromMap(json["_links"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//         "_links": links == null ? null : links.toMap(),
//       };
// }

// class WpV2WidgetsEndpoint {
//   WpV2WidgetsEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final Args21 args;

//   factory WpV2WidgetsEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2WidgetsEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null ? null : Args21.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args21 {
//   Args21({
//     this.context,
//     this.sidebar,
//     this.id,
//     this.idBase,
//     this.instance,
//     this.formData,
//   });

//   final StatusClass context;
//   final TermValue sidebar;
//   final StatusClass id;
//   final StatusClass idBase;
//   final StatusClass instance;
//   final StatusClass formData;

//   factory Args21.fromMap(Map<String, dynamic> json) => Args21(
//         context: json["context"] == null
//             ? null
//             : StatusClass.fromMap(json["context"]),
//         sidebar:
//             json["sidebar"] == null ? null : TermValue.fromMap(json["sidebar"]),
//         id: json["id"] == null ? null : StatusClass.fromMap(json["id"]),
//         idBase: json["id_base"] == null
//             ? null
//             : StatusClass.fromMap(json["id_base"]),
//         instance: json["instance"] == null
//             ? null
//             : StatusClass.fromMap(json["instance"]),
//         formData: json["form_data"] == null
//             ? null
//             : StatusClass.fromMap(json["form_data"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "context": context == null ? null : context.toMap(),
//         "sidebar": sidebar == null ? null : sidebar.toMap(),
//         "id": id == null ? null : id.toMap(),
//         "id_base": idBase == null ? null : idBase.toMap(),
//         "instance": instance == null ? null : instance.toMap(),
//         "form_data": formData == null ? null : formData.toMap(),
//       };
// }

// class WpV2WidgetsPIdW {
//   WpV2WidgetsPIdW({
//     this.namespace,
//     this.methods,
//     this.endpoints,
//   });

//   final String namespace;
//   final List<String> methods;
//   final List<WpV2WidgetsPIdWEndpoint> endpoints;

//   factory WpV2WidgetsPIdW.fromMap(Map<String, dynamic> json) => WpV2WidgetsPIdW(
//         namespace: json["namespace"] == null ? null : json["namespace"],
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         endpoints: json["endpoints"] == null
//             ? null
//             : List<WpV2WidgetsPIdWEndpoint>.from(json["endpoints"]
//                 .map((x) => WpV2WidgetsPIdWEndpoint.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "namespace": namespace == null ? null : namespace,
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "endpoints": endpoints == null
//             ? null
//             : List<dynamic>.from(endpoints.map((x) => x.toMap())),
//       };
// }

// class WpV2WidgetsPIdWEndpoint {
//   WpV2WidgetsPIdWEndpoint({
//     this.methods,
//     this.args,
//   });

//   final List<String> methods;
//   final Args22 args;

//   factory WpV2WidgetsPIdWEndpoint.fromMap(Map<String, dynamic> json) =>
//       WpV2WidgetsPIdWEndpoint(
//         methods: json["methods"] == null
//             ? null
//             : List<String>.from(json["methods"].map((x) => x)),
//         args: json["args"] == null ? null : Args22.fromMap(json["args"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "methods":
//             methods == null ? null : List<dynamic>.from(methods.map((x) => x)),
//         "args": args == null ? null : args.toMap(),
//       };
// }

// class Args22 {
//   Args22({
//     this.context,
//     this.id,
//     this.idBase,
//     this.sidebar,
//     this.instance,
//     this.formData,
//     this.force,
//   });

//   final SrcValue context;
//   final SrcValue id;
//   final SrcValue idBase;
//   final SrcValue sidebar;
//   final SrcValue instance;
//   final SrcValue formData;
//   final SrcValue force;

//   factory Args22.fromMap(Map<String, dynamic> json) => Args22(
//         context:
//             json["context"] == null ? null : SrcValue.fromMap(json["context"]),
//         id: json["id"] == null ? null : SrcValue.fromMap(json["id"]),
//         idBase:
//             json["id_base"] == null ? null : SrcValue.fromMap(json["id_base"]),
//         sidebar:
//             json["sidebar"] == null ? null : SrcValue.fromMap(json["sidebar"]),
//         instance: json["instance"] == null
//             ? null
//             : SrcValue.fromMap(json["instance"]),
//         formData: json["form_data"] == null
//             ? null
//             : SrcValue.fromMap(json["form_data"]),
//         force: json["force"] == null ? null : SrcValue.fromMap(json["force"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "context": context == null ? null : context.toMap(),
//         "id": id == null ? null : id.toMap(),
//         "id_base": idBase == null ? null : idBase.toMap(),
//         "sidebar": sidebar == null ? null : sidebar.toMap(),
//         "instance": instance == null ? null : instance.toMap(),
//         "form_data": formData == null ? null : formData.toMap(),
//         "force": force == null ? null : force.toMap(),
//       };
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
