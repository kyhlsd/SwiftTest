//
//  ArrayTest.swift
//  SwiftTest
//
//  Created by 김영훈 on 8/29/25.
//

import XCTest

final class ArrayTest: XCTestCase {

    private struct SmallModel {
        let id: UUID
        let name: String
        
        static func getSample() -> SmallModel {
            return SmallModel(id: UUID(), name: "Sample")
        }
        
        static func getDummy(count: Int) -> [SmallModel] {
            let sample = getSample()
            return [SmallModel](repeating: sample, count: count)
        }
    }
    
    private struct MediumModel {
        let id: UUID
        let name: String
        let flag: Bool
        let image: String
        let number: Int
        let score: Double
        
        static func getSample() -> MediumModel {
            return MediumModel(id: UUID(), name: "SampleName", flag: true, image: "SampleImage", number: 0, score: 0.0)
        }
        
        static func getDummy(count: Int) -> [MediumModel] {
            let sample = getSample()
            return [MediumModel](repeating: sample, count: count)
        }
    }
    
    private struct LargeModel {
        let id: UUID
        let name: String
        let flag: Bool
        let image: String
        let number: Int
        let score: Double
        let description: String
        let values: [Double]
        let items: [String]
        
        static func getSample() -> LargeModel {
            return LargeModel(id: UUID(), name: "SampleName", flag: true, image: "SampleImage", number: 0, score: 0.0, description: "SampleDescription", values: [Double](repeating: 0.0, count: 10), items: [String](repeating: "SampleItem", count: 10))
        }
        
        static func getDummy(count: Int) -> [LargeModel] {
            let sample = getSample()
            return [LargeModel](repeating: sample, count: count)
        }
    }
    
    // 0.033
    func testInsertSmall() throws {
        let item = SmallModel.getSample()
        
        self.measure {
            var list = [SmallModel]()
            (0..<10_000).forEach { _ in
                list.insert(item, at: 0)
            }
        }
    }
    
    // 0.077
    func testInsertMedium() throws {
        let item = MediumModel.getSample()
        
        self.measure {
            var list = [MediumModel]()
            (0..<10_000).forEach { _ in
                list.insert(item, at: 0)
            }
        }
    }

    // 0.107
    func testInsertLarge() throws {
        let item = LargeModel.getSample()
        
        self.measure {
            var list = [LargeModel]()
            (0..<10_000).forEach { _ in
                list.insert(item, at: 0)
            }
        }
    }
    
    // 0.001
    func testInsertSmallOnce() throws {
        var list = SmallModel.getDummy(count: 1_000_000)
        let item = SmallModel.getSample()
        
        self.measure {
            list.insert(item, at: 0)
        }
    }
    
    // 0.003
    func testInsertMediumOnce() throws {
        var list = MediumModel.getDummy(count: 1_000_000)
        let item = MediumModel.getSample()
        
        self.measure {
            list.insert(item, at: 0)
        }
    }
    
    // 0.005
    func testInsertLargeOnce() throws {
        var list = LargeModel.getDummy(count: 1_000_000)
        let item = LargeModel.getSample()
        
        self.measure {
            list.insert(item, at: 0)
        }
    }
    
    // 0.002
    func testReversedSmall() throws {
        let item = SmallModel.getSample()
        
        self.measure {
            var list = [SmallModel]()
            (0..<10_000).forEach { _ in
                list.append(item)
            }
            list = list.reversed()
        }
    }
    
    // 0.003
    func testReversedMedium() throws {
        let item = MediumModel.getSample()
        
        self.measure {
            var list = [MediumModel]()
            (0..<10_000).forEach { _ in
                list.append(item)
            }
            list = list.reversed()
        }
    }
    
    // 0.003
    func testReversedLarge() throws {
        let item = LargeModel.getSample()
        
        self.measure {
            var list = [LargeModel]()
            (0..<10_000).forEach { _ in
                list.append(item)
            }
            list = list.reversed()
        }
    }
    
    // 0.205
    func testReversedSmallOnce() throws {
        var list = SmallModel.getDummy(count: 1_000_000)
        let item = SmallModel.getSample()
        
        self.measure {
            var reversed = Array(list.reversed())
            reversed.append(item)
            list = Array(reversed.reversed())
        }
    }
    
    // 0.226
    func testReversedMediumOnce() throws {
        var list = MediumModel.getDummy(count: 1_000_000)
        let item = MediumModel.getSample()
        
        self.measure {
            var reversed = Array(list.reversed())
            reversed.append(item)
            list = Array(reversed.reversed())
        }
    }
    
    // 0.278
    func testReversedLargeOnce() throws {
        var list = LargeModel.getDummy(count: 1_000_000)
        let item = LargeModel.getSample()
        
        self.measure {
            var reversed = Array(list.reversed())
            reversed.append(item)
            list = Array(reversed.reversed())
        }
    }
}
