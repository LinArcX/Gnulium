#!/usr/bin/python3
import re
import urllib.request
import http.server

def fetchSite(url):
  req = urllib.request.Request(url)
  try:
    with urllib.request.urlopen(req) as response:
      html = response.read()
  except urllib.error.HTTPError as e:
    errorMsg = http.server.BaseHTTPRequestHandler.responses[e.code][0]
    print("Cannot retrieve URL: {} : {}".format(str(e.code), errorMsg))
  except urllib.error.URLError as e:
    print("Cannot retrieve URL: {}".format(e.reason))
  except:
    print("Cannot retrieve URL: unknown error")
    return html

def extractIconLinks(html):
  links = {}
  pattern = r'<div class="fa-hover col-md-3 col-sm-4"><a href="../icon/(.*?)"><i class="fa (.*?)"></i> (.*?)</a></div>'
  for match in re.finditer(pattern, str(html)):
    iconName = match.group(2).partition(' ')[0]
    iconLink = match.group(1)
    if iconName[:3] == "fa-":
      links[iconName] = "{}{}".format("http://fontawesome.io/icons/", iconLink)
# https://fortawesome.github.io/Font-Awesome/icon/
  return links

def extractUnicode(html):
  match = re.search(r'Unicode: <span class="upper">(.*?)</span>', str(html))
  if match:
    return "\\u{}".format(match.group(1))
  return None

def extractIconData(html):
  icons = []

  # Extract the icon urls from the given site, ...
  links = extractIconLinks(html)

  # ... fetch for each icon the unicode char.
  for key, value in links.items():
    try:
      iconHtml = fetchSite(value)
      iconUnicode = extractUnicode(iconHtml)
      icons.append({'name': key, 'link': value, 'unicode': iconUnicode})
    except:
      print("Failed to fetch icon {} from {}".format(key, value))

  return icons

def main():
  # Prepare the url of the main site ...
  fawesomeUrl = "http://fontawesome.io/icons/"

  # ... fetch its' content ...
  fawesomeHtml = fetchSite(fawesomeUrl)

  # ... and extract the icon data.
  icons = extractIconData(fawesomeHtml)

  # Write the result to fontawesome.js.
  with open('fontawesome.js', 'w') as fp:
    line = '\t'
    fp.write("var Icon = {\n")
    for icon in icons:
      escapedName = icon['name'].replace('-', '_')
      iconEntry = '{}: "{}", '.format(escapedName, icon['unicode'])
      if len('{}{}'.format(line, iconEntry)) <= 80:
        line = '{}{}'.format(line, iconEntry)
      else:
        fp.write('{}\n'.format(line))
        line = '\t{}'.format(iconEntry)
    fp.write('{}\n}};'.format(line))

if __name__ == "__main__":
  main()