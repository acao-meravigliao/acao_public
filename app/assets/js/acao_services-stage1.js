/*
 * Copyright (C) 2012-2014, Daniele Orlandi
 *
 * Author:: Daniele Orlandi <daniele@orlandi.com>
 *
 * License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
 *
 */

//= require extgui-stage1.js

/********************** INSERT STAGE 1 ASSETS HERE ****************************/
//= require ext/src/form/field/VTypes
//= require ext/src/data/Group
//= require ext/src/data/SortTypes
//= require ext/src/util/Filter
//= require ext/src/data/Operation
//= require ext/src/data/writer/Writer
//= require ext/src/data/IdGenerator
//= require ext/src/util/AbstractMixedCollection
//= require ext/src/data/validations
//= require ext/src/util/Sorter
//= require ext/src/util/HashMap
//= require ext/src/data/ResultSet
//= require ext/src/AbstractManager
//= require ext/src/data/association/Association
//= require ext/src/data/flash/BinaryXhr
//= require ext/src/data/Types
//= require ext/src/data/writer/Json
//= require ext/src/util/Sortable
//= require ext/src/util/MixedCollection
//= require ext/src/data/StoreManager
//= require ext/src/util/LruCache
//= require ext/src/data/PageMap
//= require ext/src/data/reader/Reader
//= require ext/src/data/reader/Json
//= require ext/src/data/proxy/Proxy
//= require ext/src/data/AbstractStore
//= require ext/src/data/proxy/Server
//= require ext/src/data/proxy/Client
//= require ext/src/data/proxy/Memory
//= require ext/src/data/Errors
//= require ext/src/data/Field
//= require ext/src/ModelManager
//= require ext/src/data/Model
//= require ext/src/data/Connection
//= require ext/src/Ajax
//= require ext/src/data/proxy/Ajax
//= require ext/src/data/Store
//= require ext/src/data/Request
//= require ext/src/util/Grouper
//= require ext/src/data/Batch
//= require ext/src/data/reader/Array
//= require ext/src/data/ArrayStore
//= require Extgui/data/Connection
//= require ext/src/util/History
//= require ext/src/container/Monitor
//= require ext/src/util/KeyMap
//= require ext/src/util/Memento
//= require ext/src/util/Floating
//= require ext/src/util/Bindable
//= require ext/src/state/Provider
//= require ext/src/util/Inflector
//= require ext/src/dd/DragTracker
//= require ext/src/fx/CubicBezier
//= require ext/src/panel/Proxy
//= require ext/src/util/Offset
//= require ext/src/form/action/Action
//= require ext/src/ComponentManager
//= require ext/src/container/DockingContainer
//= require ext/src/fx/Queue
//= require ext/src/Queryable
//= require ext/src/button/Manager
//= require ext/src/util/ClickRepeater
//= require ext/src/util/TextMetrics
//= require ext/src/menu/Manager
//= require ext/src/util/ElementContainer
//= require ext/src/util/Renderable
//= require ext/src/util/ProtoElement
//= require ext/src/PluginManager
//= require ext/src/app/EventDomain
//= require ext/src/ComponentQuery
//= require ext/src/layout/container/boxOverflow/None
//= require ext/src/layout/container/boxOverflow/Scroller
//= require ext/src/fx/target/Target
//= require ext/src/form/field/Field
//= require ext/src/layout/SizeModel
//= require ext/src/draw/Color
//= require ext/src/ZIndexManager
//= require ext/src/state/Manager
//= require ext/src/form/Labelable
//= require Extgui/AjaxJson
//= require Extgui/Util
//= require ext/src/form/FieldAncestor
//= require ext/src/state/LocalStorageProvider
//= require ext/src/state/CookieProvider
//= require Extgui/ModelEventDispatcher
//= require ext/src/util/ComponentDragger
//= require ext/src/util/Region
//= require ext/src/form/action/Load
//= require ext/src/form/action/Submit
//= require ext/src/fx/Easing
//= require ext/src/app/domain/Global
//= require ext/src/app/domain/Store
//= require ext/src/fx/target/Element
//= require ext/src/fx/target/ElementCSS
//= require ext/src/fx/target/CompositeElement
//= require ext/src/fx/target/Component
//= require ext/src/fx/target/Sprite
//= require ext/src/fx/target/CompositeSprite
//= require ext/src/fx/target/CompositeElementCSS
//= require ext/src/fx/Manager
//= require ext/src/fx/Animator
//= require ext/src/layout/Layout
//= require ext/src/layout/component/Component
//= require ext/src/layout/component/Dock
//= require ext/src/dd/DragDropManager
//= require ext/src/draw/Draw
//= require ext/src/fx/PropertyHandler
//= require ext/src/fx/Anim
//= require ext/src/util/Animate
//= require ext/src/state/Stateful
//= require ext/src/AbstractComponent
//= require ext/src/Component
//= require ext/src/LoadMask
//= require ext/src/app/domain/Component
//= require ext/src/app/EventBus
//= require ext/src/app/Controller
//= require ext/src/toolbar/Fill
//= require ext/src/dd/StatusProxy
//= require ext/src/layout/component/Auto
//= require ext/src/layout/component/ProgressBar
//= require ext/src/ProgressBar
//= require ext/src/layout/component/Button
//= require ext/src/button/Button
//= require ext/src/layout/component/field/Field
//= require ext/src/form/field/Base
//= require ext/src/form/field/Display
//= require ext/src/layout/component/field/Text
//= require ext/src/form/field/Text
//= require ext/src/layout/component/field/TextArea
//= require ext/src/form/field/TextArea
//= require ext/src/layout/container/Container
//= require ext/src/layout/container/Auto
//= require ext/src/layout/container/Anchor
//= require ext/src/container/AbstractContainer
//= require ext/src/container/Container
//= require ext/src/panel/Header
//= require ext/src/toolbar/Item
//= require ext/src/toolbar/Separator
//= require ext/src/layout/container/boxOverflow/Menu
//= require ext/src/layout/container/Box
//= require ext/src/layout/container/HBox
//= require ext/src/layout/container/VBox
//= require ext/src/toolbar/Toolbar
//= require ext/src/panel/AbstractPanel
//= require ext/src/dd/DragDrop
//= require ext/src/dd/DD
//= require ext/src/dd/DDProxy
//= require ext/src/dd/DragSource
//= require ext/src/panel/DD
//= require ext/src/panel/Panel
//= require ext/src/window/Window
//= require Extgui/ExceptionWindow
//= require Extgui/WallWindow
//= require ext/src/window/MessageBox
//= require ext/src/form/Basic
//= require ext/src/form/Panel
//= require AcaoServices/LoginDialog
//= require ext/src/tip/Tip
//= require ext/src/tip/ToolTip
//= require ext/src/tip/QuickTip
//= require ext/src/tip/QuickTipManager
//= require ext/src/app/Application
//= require Extgui/app/Base
//= require AcaoServices/Application
//= require ext/src/layout/component/Body
//= require ext/src/dom/Layer
//= require ext/src/ShadowPool
//= require ext/src/Shadow
//= require ext/src/layout/container/Fit
//= require ext/src/menu/Item
//= require ext/src/menu/CheckItem
//= require ext/src/util/KeyNav
//= require ext/src/FocusManager
//= require ext/src/menu/KeyNav
//= require ext/src/menu/Separator
//= require ext/src/menu/Menu
//= require ext/src/util/Queue
//= require ext/src/layout/ClassList
//= require ext/src/layout/ContextItem
//= require ext/src/layout/Context
//= require ext/src/ElementLoader
//= require ext/src/ComponentLoader
//= require ext/src/resizer/Resizer
//= require ext/src/resizer/ResizeTracker
//= require ext/src/app/domain/Controller
//= require ext/src/util/CSS
//= require ext/src/panel/Tool
//= require ext/src/Img
/********************** STAGE 1 ASSETS END  ****************************/

//= require ext_patches.js