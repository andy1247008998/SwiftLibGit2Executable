//
//  Blame.swift
//
//
//  Created by ailion on 2020/1/12.
//

import Clibgit2

class Blame {
    
    static func buffer(reference: OpaquePointer, bufferString: String, buffer_len: Int) -> OpaquePointer? {
        var out: OpaquePointer? = nil
        let buffer = UnsafePointer<Int8>(bufferString)
        let errorCode = git_blame_buffer(&out, reference, buffer, buffer_len)
        switch errorCode {
        case 0:
            return out
        default:
            print("git_blame_buffer Error Code: \(errorCode)")
            return nil
        }
    }
    
    static func file(repo: OpaquePointer, pathString: String, options: UnsafeMutablePointer<git_blame_options>) -> OpaquePointer? {
        var out: OpaquePointer? = nil
        let path = UnsafePointer<Int8>(pathString)
        let errorCode = git_blame_file(&out, repo, path, options)
        switch errorCode {
        case 0:
            return out
        default:
            print("git_blame_file Error Code: \(errorCode)")
            return nil
        }
    }
    
    static func free(blame: OpaquePointer) {
        git_blame_free(blame)
    }
    
    static func get_hunk_byindex(blame: OpaquePointer, index: UInt32) -> git_blame_hunk? {
        git_blame_get_hunk_byindex(blame, index).pointee
    }
    
    
}
