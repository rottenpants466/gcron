using component.button;
public class component.Grid : Gtk.Grid{

    public int position { get; set;}
    public int space { get; set;}
    public ListBox listBox { get; construct;}

    public Grid(ListBox listBox){
        Object(
            position:0,
            space:50,
            listBox:listBox
        );
    }

    public void log_info(){
        listBox.add_info_log("Message from the grid");
    }

    public void log_error(){
        listBox.add_error_log("Error from the grid");
    }

    public void add_space(){
        var label = new Gtk.Label("");
        attach(label,0,position*space);
        position++;
    }

    public void add_full_line(string expression,string command){
        var expressionLabel = new Gtk.Label(expression);
        attach(expressionLabel,0,position*space);

        var label2=new Gtk.Label("\t");
        attach_next_to(label2,expressionLabel,Gtk.PositionType.RIGHT);
        
        var commandLabel = new Gtk.Label(command);
        attach_next_to(commandLabel,label2,Gtk.PositionType.RIGHT);

        var label4=new Gtk.Label("\t");
        attach_next_to(label4,commandLabel,Gtk.PositionType.RIGHT);

        Gtk.Button button1 = new Gtk.Button.with_label ("Explain");
        button1.clicked.connect (this.log_info);
        attach_next_to(button1,label4,Gtk.PositionType.RIGHT);

        DisplayButton displayButton = new DisplayButton (listBox,expressionLabel,commandLabel);
        attach_next_to(displayButton,button1,Gtk.PositionType.RIGHT);

        Gtk.Button button3 = new Gtk.Button.with_label ("Delete");
        button3.clicked.connect (this.log_error);
        attach_next_to(button3,displayButton,Gtk.PositionType.RIGHT);

        position++;
    }

    public void add_empty_line(){
        var entry1 = new Gtk.Entry();
        attach(entry1,0,position*space);

        var label2=new Gtk.Label("\t");
        attach_next_to(label2,entry1,Gtk.PositionType.RIGHT);
        
        var entry2 = new Gtk.Entry();
        attach_next_to(entry2,label2,Gtk.PositionType.RIGHT);

        var label4=new Gtk.Label("\t");
        attach_next_to(label4,entry2,Gtk.PositionType.RIGHT);

        Gtk.Button button1 = new Gtk.Button.with_label ("Explain");
        attach_next_to(button1,label4,Gtk.PositionType.RIGHT);

        Gtk.Button button2 = new Gtk.Button.with_label ("Add");
        attach_next_to(button2,button1,Gtk.PositionType.RIGHT);

        position++;
    }
}