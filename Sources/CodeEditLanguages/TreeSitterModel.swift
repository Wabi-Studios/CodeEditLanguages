/* -----------------------------------------------------------
 * :: :  C  O  S  M  O  :                                   ::
 * -----------------------------------------------------------
 * @wabistudios :: cosmos :: realms
 *
 * CREDITS.
 *
 * T.Furby              @furby-tm       <devs@wabi.foundation>
 *
 *         Copyright (C) 2023 Wabi Animation Studios, Ltd. Co.
 *                                        All Rights Reserved.
 * -----------------------------------------------------------
 *  . x x x . o o o . x x x . : : : .    o  x  o    . : : : .
 * ----------------------------------------------------------- */

import Foundation
import SwiftTreeSitter

/// A singleton class to manage `tree-sitter` queries and keep them in memory.
public class TreeSitterModel
{
  /// The singleton/shared instance of ``TreeSitterModel``.
  public static let shared: TreeSitterModel = .init()

  /// Get a query for a specific language
  /// - Parameter language: The language to request the query for.
  /// - Returns: A Query if available. Returns `nil` for not implemented languages
  public func query(for language: TreeSitterLanguage) -> Query?
  {
    // swiftlint:disable:previous cyclomatic_complexity function_body_length
    switch language
    {
      case .bash:
        return bashQuery
      case .c:
        return cQuery
      case .cpp:
        return cppQuery
      case .cSharp:
        return cSharpQuery
      case .css:
        return cssQuery
      case .dart:
        return dartQuery
      case .dockerfile:
        return dockerfileQuery
      case .elixir:
        return elixirQuery
      case .go:
        return goQuery
      case .goMod:
        return goModQuery
      case .haskell:
        return haskellQuery
      case .html:
        return htmlQuery
      case .java:
        return javaQuery
      case .javascript:
        return javascriptQuery
      case .jsdoc:
        return jsdocQuery
      case .json:
        return jsonQuery
      case .jsx:
        return jsxQuery
      case .kotlin:
        return kotlinQuery
      case .lua:
        return luaQuery
      case .markdown:
        return markdownQuery
      case .markdownInline:
        return markdownInlineQuery
      case .objc:
        return objcQuery
      case .ocaml:
        return ocamlQuery
      case .ocamlInterface:
        return ocamlInterfaceQuery
      case .php:
        return phpQuery
      case .python:
        return pythonQuery
      case .regex:
        return regexQuery
      case .ruby:
        return rubyQuery
      case .rust:
        return rustQuery
      case .scala:
        return scalaQuery
      case .sql:
        return sqlQuery
      case .swift:
        return swiftQuery
      case .toml:
        return tomlQuery
      case .tsx:
        return tsxQuery
      case .typescript:
        return typescriptQuery
      case .yaml:
        return yamlQuery
      case .zig:
        return zigQuery
      case .plainText:
        return nil
    }
  }

  /// Query for `Bash` files.
  public private(set) lazy var bashQuery: Query? = queryFor(.bash)

  /// Query for `C` files.
  public private(set) lazy var cQuery: Query? = queryFor(.c)

  /// Query for `C++` files.
  public private(set) lazy var cppQuery: Query? = queryFor(.cpp)

  /// Query for `C#` files.
  public private(set) lazy var cSharpQuery: Query? = queryFor(.cSharp)

  /// Query for `CSS` files.
  public private(set) lazy var cssQuery: Query? = queryFor(.css)

  /// Query for `Dart` files.
  public private(set) lazy var dartQuery: Query? = query(for: .dart)

  /// Query for `Dockerfile` files.
  public private(set) lazy var dockerfileQuery: Query? = queryFor(.dockerfile)

  /// Query for `Elixir` files.
  public private(set) lazy var elixirQuery: Query? = queryFor(.elixir)

  /// Query for `Go` files.
  public private(set) lazy var goQuery: Query? = queryFor(.go)

  /// Query for `GoMod` files.
  public private(set) lazy var goModQuery: Query? = queryFor(.goMod)

  /// Query for `Haskell` files.
  public private(set) lazy var haskellQuery: Query? = queryFor(.haskell)

  /// Query for `HTML` files.
  public private(set) lazy var htmlQuery: Query? = queryFor(.html)

  /// Query for `Java` files.
  public private(set) lazy var javaQuery: Query? = queryFor(.java)

  /// Query for `JavaScript` files.
  public private(set) lazy var javascriptQuery: Query? = queryFor(.javascript)

  /// Query for `JSDoc` files.
  public private(set) lazy var jsdocQuery: Query? = queryFor(.jsdoc)

  /// Query for `JSX` files.
  public private(set) lazy var jsxQuery: Query? = queryFor(.jsx)

  /// Query for `JSON` files.
  public private(set) lazy var jsonQuery: Query? = queryFor(.json)

  /// Query for `Kotlin` files.
  public private(set) lazy var kotlinQuery: Query? = queryFor(.kotlin)

  /// Query for `Lua` files.
  public private(set) lazy var luaQuery: Query? = queryFor(.lua)

  /// Query for `Markdown` files.
  public private(set) lazy var markdownQuery: Query? = queryFor(.markdown)

  /// Query for `Markdown Inline` files.
  public private(set) lazy var markdownInlineQuery: Query? = queryFor(.markdownInline)

  /// Query for `Objective C` files.
  public private(set) lazy var objcQuery: Query? = queryFor(.objc)

  /// Query for `OCaml` files.
  public private(set) lazy var ocamlQuery: Query? = queryFor(.ocaml)

  /// Query for `OCaml Interface` files.
  public private(set) lazy var ocamlInterfaceQuery: Query? = queryFor(.ocamlInterface)

  /// Query for `PHP` files.
  public private(set) lazy var phpQuery: Query? = queryFor(.php)

  /// Query for `Python` files.
  public private(set) lazy var pythonQuery: Query? = queryFor(.python)

  /// Query for `Regex` files.
  public private(set) lazy var regexQuery: Query? = queryFor(.regex)

  /// Query for `Ruby` files.
  public private(set) lazy var rubyQuery: Query? = queryFor(.ruby)

  /// Query for `Rust` files.
  public private(set) lazy var rustQuery: Query? = queryFor(.rust)

  /// Query for `Scala` files.
  public private(set) lazy var scalaQuery: Query? = queryFor(.scala)

  /// Query for `SQL` files.
  public private(set) lazy var sqlQuery: Query? = queryFor(.sql)

  /// Query for `Swift` files.
  public private(set) lazy var swiftQuery: Query? = queryFor(.swift)

  /// Query for `TOML` files.
  public private(set) lazy var tomlQuery: Query? = queryFor(.toml)

  /// Query for `TSX` files.
  public private(set) lazy var tsxQuery: Query? = queryFor(.tsx)

  /// Query for `Typescript` files.
  public private(set) lazy var typescriptQuery: Query? = queryFor(.typescript)

  /// Query for `YAML` files.
  public private(set) lazy var yamlQuery: Query? = queryFor(.yaml)

  /// Query for `Zig` files.
  public private(set) lazy var zigQuery: Query? = queryFor(.zig)

  private func queryFor(_ codeLanguage: CodeLanguage) -> Query?
  {
    // get the tree-sitter language and query url if available
    guard let language = codeLanguage.language,
          let url = codeLanguage.queryURL else { return nil }

    // 1. if the language depends on another language combine the query files
    // 2. if the language has additional query files combine them with the main one
    // 3. otherwise return the query file
    if let parentURL = codeLanguage.parentQueryURL,
       let data = combinedQueryData(for: [url, parentURL])
    {
      return try? Query(language: language, data: data)
    }
    else if let additionalHighlights = codeLanguage.additionalHighlights
    {
      var addURLs = additionalHighlights.compactMap { codeLanguage.queryURL(for: $0) }
      addURLs.append(url)
      guard let data = combinedQueryData(for: addURLs) else { return nil }
      return try? Query(language: language, data: data)
    }
    else
    {
      return try? language.query(contentsOf: url)
    }
  }

  private func combinedQueryData(for fileURLs: [URL]) -> Data?
  {
    let rawQuery = fileURLs.compactMap { try? String(contentsOf: $0) }.joined(separator: "\n")
    if !rawQuery.isEmpty
    {
      return rawQuery.data(using: .utf8)
    }
    else
    {
      return nil
    }
  }

  private init() {}
}
