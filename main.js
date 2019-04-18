defineClass("ViewController", {
    tableView_cellForRowAtIndexPath: function(tableView, indexPath) {
        var array = [ "Chinese", "Math", "English", "Gym", "History" ];
        var cell = tableView.dequeueReusableCellWithIdentifier_forIndexPath("UITableViewCell", indexPath);
        cell.textLabel().setText(array[indexPath.row()]);
        return cell;
    }
}, {});


defineClass("OneViewController", {
            tableView_cellForRowAtIndexPath: function(tableView, indexPath) {
            var array = [ "AAA", "BBBB", "CCCCC", "DDDD", "EEEEE" ];
            var cell = tableView.dequeueReusableCellWithIdentifier_forIndexPath("UITableViewCell", indexPath);
            cell.textLabel().setText(array[indexPath.row()]);
            return cell;
            }
            }, {});


