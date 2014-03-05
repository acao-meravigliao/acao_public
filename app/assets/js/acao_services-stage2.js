/*
 * Copyright (C) 2012-2014, Daniele Orlandi
 *
 * Author:: Daniele Orlandi <daniele@orlandi.com>
 *
 * License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
 *
 */

//= require extgui-stage2

/********************** INSERT STAGE 2 ASSETS HERE ****************************/
//= require ext/src/grid/ColumnManager
//= require ext/src/layout/component/FieldSet
//= require ext/src/form/FieldSet
//= require Extgui/form/ModelFormPanel
//= require ext/src/container/Viewport
//= require Extgui/Card
//= require ext/src/toolbar/TextItem
//= require ext/src/form/CheckboxManager
//= require ext/src/form/RadioManager
//= require ext/src/AbstractPlugin
//= require ext/src/grid/CellContext
//= require Extgui/form/BasicForm
//= require ext/src/layout/container/Card
//= require ext/src/layout/container/border/Region
//= require ext/src/panel/Table
//= require ext/src/grid/ColumnComponentLayout
//= require ext/src/layout/component/BoundList
//= require ext/src/layout/component/field/Trigger
//= require ext/src/grid/RowEditorButtons
//= require ext/src/button/Split
//= require ext/src/picker/Month
//= require ext/src/grid/ColumnLayout
//= require ext/src/layout/component/field/FieldContainer
//= require ext/src/tab/Tab
//= require ext/src/util/Point
//= require ext/src/resizer/Splitter
//= require ext/src/data/Tree
//= require ext/src/grid/plugin/HeaderResizer
//= require ext/src/data/NodeInterface
//= require ext/src/layout/container/Editor
//= require Extgui/data/JsonReader
//= require Extgui/data/JsonWriter
//= require ext/src/view/TableLayout
//= require ext/src/view/NodeCache
//= require ext/src/data/proxy/Rest
//= require ext/src/selection/Model
//= require ext/src/dd/DragZone
//= require ext/src/selection/DataViewModel
//= require ext/src/dd/Registry
//= require ext/src/dd/DDTarget
//= require ext/src/dd/ScrollManager
//= require ext/src/form/field/Checkbox
//= require ext/src/form/field/Radio
//= require ext/src/grid/plugin/DragDrop
//= require ext/src/selection/CellModel
//= require Extgui/form/FormPanel
//= require ext/src/layout/component/field/ComboBox
//= require ext/src/grid/RowEditor
//= require ext/src/picker/Date
//= require ext/src/form/field/Trigger
//= require Extgui/form/field/Password
//= require ext/src/form/field/Picker
//= require ext/src/form/field/Date
//= require ext/src/form/FieldContainer
//= require Extgui/form/field/DateTime
//= require ext/src/tab/Bar
//= require ext/src/tab/Panel
//= require Extgui/TabPanel
//= require ext/src/form/field/Spinner
//= require Extgui/form/field/EngNumber
//= require ext/src/resizer/BorderSplitter
//= require ext/src/layout/container/Border
//= require ext/src/data/TreeStore
//= require ext/src/Editor
//= require ext/src/grid/CellEditor
//= require ext/src/selection/RowModel
//= require ext/src/selection/TreeModel
//= require ext/src/data/NodeStore
//= require ext/src/form/field/Number
//= require ext/src/toolbar/Paging
//= require Extgui/data/HelProxy
//= require Extgui/data/Model
//= require Extgui/notification/Message
//= require Extgui/Notification
//= require ext/src/grid/header/DragZone
//= require ext/src/view/AbstractView
//= require ext/src/view/View
//= require ext/src/view/BoundList
//= require ext/src/view/BoundListKeyNav
//= require ext/src/form/field/ComboBox
//= require ext/src/picker/Time
//= require ext/src/form/field/Time
//= require ext/src/view/Table
//= require ext/src/tree/View
//= require ext/src/dd/DropTarget
//= require ext/src/dd/DropZone
//= require ext/src/grid/header/DropZone
//= require ext/src/grid/plugin/HeaderReorderer
//= require ext/src/grid/header/Container
//= require ext/src/grid/column/Column
//= require ext/src/grid/column/Date
//= require ext/src/grid/column/Template
//= require ext/src/grid/column/Number
//= require ext/src/grid/column/RowNumberer
//= require Extgui/column/Decimal
//= require Extgui/column/String
//= require Extgui/column/StringTemplate
//= require ext/src/grid/plugin/Editing
//= require ext/src/grid/plugin/RowEditing
//= require ext/src/grid/plugin/CellEditing
//= require Extgui/MainControllerBase
//= require ext/src/tree/Column
//= require ext/src/tree/Panel
//= require AcaoServices/Viewport
//= require AcaoServices/MainController
//= require Extgui/Plugin
//= require Extgui/Acao/Plugin
//= require Extgui/SearchField
//= require ext/src/data/association/BelongsTo
//= require ext/src/grid/View
//= require ext/src/data/association/HasMany
//= require Extgui/index/Filter/Panel
//= require Extgui/index/Filter/Raw
//= require Extgui/index/Filter/Field
//= require ext/src/grid/plugin/BufferedRendererTreeView
//= require ext/src/grid/plugin/BufferedRendererTableView
//= require Ygg/Acao/Plane
//= require Ygg/Acao/Flight
//= require ext/src/grid/Panel
//= require Ygg/Core/Person
//= require Extgui/index/Filter/Date
//= require Extgui/index/Filter/Number
//= require Extgui/index/Filter/Decimal
//= require Extgui/index/Filter/Float
//= require Extgui/index/Filter/Int
//= require ext/src/grid/plugin/BufferedRenderer
//= require Extgui/index/Filter/Set
//= require Extgui/index/Filter/Boolean
//= require Extgui/index/Filter/Scope
//= require Extgui/index/Filter/String
//= require Extgui/index/Filter/Button
//= require Extgui/index/GridPanelBase
//= require Extgui/Acao/Plane/IndexPanel
//= require Extgui/Acao/Flight/IndexPanel
//= require ext/src/selection/CheckboxModel
//= require ext/src/resizer/SplitterTracker
//= require ext/src/view/DragZone
//= require ext/src/resizer/BorderSplitterTracker
//= require ext/src/grid/locking/View
//= require ext/src/grid/locking/HeaderContainer
//= require ext/src/view/DropZone
//= require ext/src/grid/ViewDropZone
//= require ext/src/grid/locking/Lockable
//= require Extgui/Acao/Plane/Form
//= require Extgui/Shop/Plugin
//= require Extgui/Shop/Product/Option/Range
//= require Extgui/Shop/Product/Option/Selection
//= require Extgui/Shop/Agreement/InstantiateButton
//= require Extgui/Core/MergeWindow
//= require Extgui/Core/Plugin
//= require Extgui/Core/Location/Picker
//= require Extgui/object/View
//= require Extgui/form/ModelBasicForm
//= require Extgui/object/Manager
//= require Extgui/object/PickerButton
//= require Extgui/object/Picker
//= require Extgui/object/CreateWindow
//= require Extgui/object/PolymorphicView
//= require Extgui/gmaps/Util
//= require Extgui/gmaps/Loader
//= require Extgui/gmaps/Geocoder
//= require Extgui/form/field/JsObject
//= require Extgui/index/TreePanelBase
//= require Extgui/gmaps/Map
//= require Extgui/form/field/CollectionFieldMixin
//= require Extgui/form/field/Interval
//= require Extgui/form/field/JsObjectDiff
//= require Extgui/form/field/DecimalNumber
//= require Extgui/form/field/ReferenceField
//= require Extgui/form/field/PriceForPeriod
//= require Extgui/layout/component/field/ObjectsCollection
//= require Extgui/SearchPanel
//= require Extgui/form/field/CollectionBaseMixin
//= require Extgui/object/service/SuspendWindow
//= require Extgui/form/field/JsonAsText
//= require Extgui/column/EngNumber
//= require Extgui/ChangePasswordWindow
//= require Extgui/WizardPanelBase
//= require Ygg/Shop/BillingEntry
//= require Ygg/Shop/Reseller
//= require Ygg/Shop/Agreement
//= require Ygg/Shop/Package
//= require Ygg/Shop/ProductRevision
//= require Ygg/Shop/Invoice
//= require Ygg/Core/Organization
//= require ext/src/tree/ViewDragZone
//= require ext/src/layout/container/Column
//= require Ygg/Shop/PackageInstance
//= require ext/src/grid/column/CheckColumn
//= require ext/src/tree/ViewDropZone
//= require ext/src/tree/plugin/TreeViewDragDrop
//= require Ygg/Core/HttpSession
//= require Ygg/Core/Taask
//= require ext/src/layout/container/Absolute
//= require Ygg/Core/Klass
//= require Ygg/Core/Capability
//= require Ygg/Core/NotifTemplate
//= require Ygg/Core/Group
//= require Ygg/Core/Notification
//= require Ygg/Core/LogEntry
//= require ext/src/data/association/HasOne
//= require ext/src/grid/feature/Feature
//= require ext/src/util/Cookies
//= require ext/src/picker/Color
//= require ext/src/grid/feature/AbstractSummary
//= require ext/src/grid/feature/GroupStore
//= require Ygg/Core/Identity
//= require ux/CTemplate
//= require ext/src/chart/Highlight
//= require ext/src/chart/Callout
//= require ext/src/chart/Label
//= require ext/src/layout/component/field/HtmlEditor
//= require ext/src/chart/theme/Theme
//= require ext/src/chart/Navigation
//= require ext/src/chart/theme/Base
//= require ext/src/layout/component/Draw
//= require ext/src/chart/MaskLayer
//= require ext/src/draw/CompositeSprite
//= require ext/src/chart/Shape
//= require Extgui/Shop/ServicePicker
//= require Extgui/Shop/Reseller/IndexPanel
//= require Extgui/Shop/BillingEntry/IndexPanel
//= require Extgui/Shop/BillingEntry/IndexPanelForCustomer
//= require Extgui/Shop/Package/IndexPanel
//= require Extgui/Core/Location/PickerWindow
//= require Extgui/Core/Location/ReferenceField
//= require Extgui/Core/Group/IndexPanel
//= require Extgui/Core/Task/Form
//= require Extgui/Core/Task/IndexPanel
//= require Extgui/Core/Task/IndexGridPanel
//= require Extgui/Core/NotifTemplate/Form
//= require Extgui/Core/NotifTemplate/IndexPanel
//= require Extgui/Core/Identity/IndexPanel
//= require Extgui/Core/Identity/Credential/HashedPassword/Form
//= require Extgui/Core/Identity/Credential/X509Certificate/Form
//= require Extgui/Core/Identity/Credential/ObfuscatedPassword/Form
//= require Extgui/Core/LogEntry/Detail/Form
//= require Extgui/Core/LogEntry/IndexPanel
//= require Extgui/Core/HttpSession/IndexPanel
//= require Extgui/Core/Notification/IndexPanel
//= require Extgui/Core/Capability/Form
//= require Extgui/Core/Klass/Form
//= require Extgui/Core/Klass/IndexPanel
//= require Extgui/Core/Capability/IndexPanel
//= require Extgui/object/Base
//= require Extgui/Acao/Plane
//= require Extgui/Acao/Flight
//= require Extgui/Acao/Flight/View
//= require Extgui/Acao/Plane/View
//= require Extgui/Acao/Plane/Picker
//= require Extgui/Acao/Plane/ReferenceField
//= require Extgui/Shop/BillingEntry
//= require Extgui/Shop/Reseller
//= require Extgui/Shop/Package
//= require Extgui/Shop/Invoice
//= require Extgui/Shop/Agreement
//= require Extgui/Shop/Reseller/View
//= require Extgui/Shop/Reseller/Picker
//= require Extgui/Shop/Reseller/ReferenceField
//= require Extgui/Shop/Package/View
//= require Extgui/Shop/Package/Picker
//= require Extgui/Shop/Package/ReferenceField
//= require Extgui/Shop/BillingEntry/View
//= require Extgui/Shop/BillingEntry/Picker
//= require Extgui/Shop/Agreement/View
//= require Extgui/Shop/Agreement/Picker
//= require Extgui/Shop/Agreement/ReferenceField
//= require Extgui/Core/HttpSession
//= require Extgui/Core/Person
//= require Extgui/Core/Klass
//= require Extgui/Core/Capability
//= require Extgui/Core/Orgaperson
//= require Extgui/Shop/Invoice/IndexPanelForCustomer
//= require Extgui/Shop/Invoice/IndexPanel
//= require Extgui/Core/NotifTemplate
//= require Extgui/Core/Organization
//= require Extgui/Core/Group
//= require Extgui/Core/Identity
//= require Extgui/Core/Notification
//= require Extgui/Shop/Invoice/View
//= require Extgui/Shop/Invoice/Picker
//= require Extgui/Shop/Invoice/ReferenceField
//= require Extgui/Core/Person/View
//= require Extgui/Core/Person/Picker
//= require Extgui/Core/Person/ReferenceField
//= require Extgui/Acao/Flight/Form
//= require Extgui/Acao/Flight/Picker
//= require Extgui/Acao/Flight/ReferenceField
//= require Extgui/Core/Organization/View
//= require Extgui/Core/Organization/Picker
//= require Extgui/Core/Organization/ReferenceField
//= require Extgui/Core/Orgaperson/View
//= require Extgui/Core/Group/View
//= require Extgui/Core/Group/Picker
//= require Extgui/Core/Group/ReferenceField
//= require Extgui/Shop/Reseller/Form
//= require Extgui/Core/NotifTemplate/View
//= require Extgui/Core/NotifTemplate/Picker
//= require Extgui/Core/NotifTemplate/ReferenceField
//= require Extgui/Core/Identity/View
//= require Extgui/Core/Notification/View
//= require Extgui/Core/Notification/Form
//= require Extgui/Core/HttpSession/ReferenceField
//= require Extgui/Core/Notification/Picker
//= require Extgui/Core/Notification/ReferenceField
//= require Extgui/Core/Klass/View
//= require Extgui/Core/Klass/Picker
//= require Extgui/Core/Capability/View
//= require Extgui/Core/Capability/Picker
//= require Extgui/Core/Capability/ReferenceField
//= require Extgui/Core/Klass/ReferenceField
//= require Extgui/form/field/PolyReferenceField
//= require Extgui/form/field/CollectionTree
//= require Extgui/Shop/Invoice/DetailsPanel
//= require Extgui/form/field/CollectionGrid
//= require Extgui/Shop/ProductRevision/Option/CollectionField
//= require Extgui/Shop/Package/BuySelector
//= require Extgui/Shop/Invoice/BillingEntry/CollectionField
//= require Extgui/Core/Person/CollectionField
//= require Extgui/Core/Organization/CollectionField
//= require Extgui/Core/Channel/CollectionField
//= require Extgui/Core/Organization/Form
//= require Extgui/Core/Identity/Credential/CollectionField
//= require Extgui/Core/LogEntry/Detail/CollectionGridField
//= require Extgui/Core/Identity/Capability/CollectionField
//= require Extgui/Core/Identity/Form
//= require Extgui/Core/Identity/Picker
//= require Extgui/Core/Group/Member/CollectionField
//= require Extgui/Core/Group/Form
//= require Extgui/Core/Identity/CollectionField
//= require Extgui/Core/Identity/ReferenceField
//= require Extgui/Core/LogEntry/Form
//= require Extgui/Core/HttpSession/Form
//= require Extgui/Core/Person/MergeWindow
//= require Extgui/Core/Person/IndexPanel
//= require Extgui/Core/Organization/MergeWindow
//= require Extgui/Core/Organization/IndexPanel
//= require Extgui/object/panel/Acl
//= require Extgui/object/panel/Notifications
//= require Extgui/object/panel/Log
//= require Extgui/ChangeThemeWindow
//= require Ygg/Shop/Product
//= require Extgui/Shop/Product
//= require Extgui/Shop/ProductRevision/IndexPanel
//= require Extgui/Shop/BillingEntry/CollectionField
//= require Extgui/Shop/Product/IndexPanel
//= require Extgui/Shop/Product/View
//= require Extgui/Shop/Product/Picker
//= require Extgui/Shop/Agreement/CollectionGridField
//= require Extgui/Shop/Agreement/CollectionField
//= require Extgui/Shop/Agreement/ServiceInstancesPanel
//= require Extgui/Shop/Agreement/IndexPanel
//= require Extgui/Shop/PackageInstance/IndexPanel
//= require Extgui/Shop/PackageInstance/TreeForCustomer
//= require Extgui/Shop/PackageInstance/Tree
//= require Extgui/Shop/Product/ReferenceField
//= require Extgui/Shop/ProductRevision/Form
//= require Extgui/Shop/Package/Product/Form
//= require Extgui/Shop/Package/Product/CollectionField
//= require Extgui/Shop/Product/RevisionsFrame
//= require Extgui/Shop/Product/Form
//= require Extgui/Core/Person/Form
//= require Extgui/Core/Orgaperson/Picker
//= require Extgui/Core/Orgaperson/ReferenceField
//= require Extgui/Shop/BillingEntry/Form
//= require Extgui/Shop/Invoice/Form
//= require Extgui/Core/Orgaperson/PickerButton
//= require ext/src/grid/feature/Grouping
//= require Extgui/Shop/PricesSummary
//= require Extgui/Shop/Agreement/Form
//= require Extgui/Shop/Agreement/WizardCreatePanel
//= require ext/src/form/field/HtmlEditor
//= require Extgui/Shop/Package/Form
//= require ux/grid/column/Component
//= require Extgui/Core/Task/Tree
//= require Extgui/Core/ProvisioningWidget
//= require Extgui/object/panel/Base
//= require Extgui/Acao/Flight/ObjectPanel
//= require Extgui/Acao/Plane/ObjectPanel
//= require Extgui/Shop/Reseller/ObjectPanel
//= require Extgui/Shop/ProductRevision/ObjectPanel
//= require Extgui/Shop/Product/ObjectPanel
//= require Extgui/Shop/Invoice/ObjectPanel
//= require Extgui/Shop/Agreement/ObjectPanel
//= require Extgui/Shop/BillingEntry/ObjectPanel
//= require Extgui/Shop/Package/ObjectPanel
//= require Extgui/Core/Person/ObjectPanel
//= require Extgui/Core/Task/ObjectPanel
//= require Extgui/Core/NotifTemplate/ObjectPanel
//= require Extgui/Core/Identity/ObjectPanel
//= require Extgui/Core/LogEntry/ObjectPanel
//= require Extgui/Core/Group/ObjectPanel
//= require Extgui/Core/Notification/ObjectPanel
//= require Extgui/Core/HttpSession/ObjectPanel
//= require Extgui/Core/Organization/ObjectPanel
//= require Extgui/Core/Capability/ObjectPanel
//= require Extgui/Core/Klass/ObjectPanel
//= require ext/src/chart/Mask
//= require ext/src/chart/LegendItem
//= require ext/src/chart/Legend
//= require ext/src/draw/Surface
//= require ext/src/draw/Component
//= require ext/src/chart/TipSurface
//= require ext/src/chart/Tip
//= require ext/src/chart/series/Series
//= require ext/src/chart/series/Gauge
//= require ext/src/chart/Chart
//= require ext/src/chart/axis/Abstract
//= require ext/src/chart/axis/Gauge
//= require Extgui/form/field/QuotaGauge
/********************** STAGE 2 ASSETS END  ****************************/
