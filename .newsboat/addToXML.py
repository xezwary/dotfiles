#!/usr/bin/env python3
# -- coding: utf-8 --
import xml.etree.ElementTree as ET
from argparse import ArgumentParser

def fileWrite(File, content):
    with open(File, "a") as i:
        i.write("{0}".format(content))

if __name__ == "__main__":
    parser = ArgumentParser( description="Write rss.")
    parser.add_argument("arrs", metavar="a", type=str, help="arguments", nargs="*")
    args = parser.parse_args()
    link = args.arrs[0]
    title = args.arrs[1]
    if args.arrs[2] != None:
        desc = args.arrs[2]
    tree = ET.parse("/home/haakon/.newsboat/rss.xml")
    xmlRoot = tree.getroot()
    xmlRoot = xmlRoot.find(".//")
    child = ET.Element("item")
    b = ET.SubElement(child, "title")
    b.text = title
    c = ET.SubElement(child, "link", attrib={"href":link})
    c.text = link
    if len(args.arrs[2]) > 0:
        d = ET.SubElement(child, "description")
        d.text = desc 
        fileWrite("/home/haakon/.newsboat/bookmarks.txt", "\n{0}     {1}    {2}".format(link, title, desc))
    else:
        fileWrite("/home/haakon/.newsboat/bookmarks.txt", "\n{0}     {1}".format(link, title))
    xmlRoot.insert(3, child)
    tree.write("/home/haakon/.newsboat/rss.xml", xml_declaration=True, method="xml", encoding="UTF-8")
