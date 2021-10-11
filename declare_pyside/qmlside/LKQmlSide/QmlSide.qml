import QtQuick

Item {
    id: root
    objectName: 'QmlSide'

    function bind(t_obj, s_obj, expression) {
        console.log(t_obj, s_obj)
        console.log(expression)
        eval(expression)
    }

    function connect_func(s_obj, s_prop, func_id, participants) {
        eval(`
            s_obj.${s_prop} = Qt.binding(
                () => PySide.eval('${func_id}', ${participants})
            )
        `)
    }

    function create_component(qmlfile) {
        return Qt.createComponent(qmlfile)
    }

    function create_object(component, container) {
        return component.createObject(container)
    }

    function eval_js(code, args) {
        console.log(code, args)
        eval(code)
    }

    // Component.onCompleted: {
    //     console.log('register qmlside object')
    //     pyside.call('__register_qmlside_object', root)
    // }
}
