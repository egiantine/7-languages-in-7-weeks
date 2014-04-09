#!/usr/local/bin/io

"# === Expand XML program with indents" println

Builder := Object clone
Builder depth := 0
Builder indent := method(x, s := ""; for(i, 1, x, s := s .. "  "); return s)
Builder printAsAttribute := method(x,
  kv := x asString asMutable split(" => ")
  write(" ",
        kv at(0) asMutable removePrefix("\"") removeSuffix("\""),
        "=",
        kv at(1))
)
Builder forward := method(
  tagname := call message name
  write(indent(depth), "<", tagname)
  args := call message arguments
  first := args first
  if (first name == "curlyBrackets", 
      printAsAttribute(first argAt(0));
      args removeFirst)
  writeln(">")
  args foreach(
  arg, 
  depth = depth + 1;
  content := self doMessage(arg); 
  depth = depth - 1;
  if(content type == "Sequence", writeln(indent(depth + 1), content)))
  writeln(indent(depth), "</", tagname, ">"))

Builder  ul({"author" => "Tate"},
  	    li("Io"), 
	    li("Lua"), 
	    li("JavaScript"))


"# === Create a list syntax that uses brackets" println
List curlyBrackets := method(call message arguments)
list{1,2,3,4,5} println

