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
    
    // 0.015
    func testInsertAndReplaceSmall() throws {
        var list = SmallModel.getDummy(count: 1_000_000)
        let item = SmallModel.getSample()
        
        self.measure {
            var inserted = list
            inserted.insert(item, at: 0)
            list = inserted
        }
    }
    
    // 0.024
    func testInsertAndReplaceMedium() throws {
        var list = MediumModel.getDummy(count: 1_000_000)
        let item = MediumModel.getSample()
        
        self.measure {
            var inserted = list
            inserted.insert(item, at: 0)
            list = inserted
        }
    }
    
    // 0.045
    func testInsertAndReplaceLarge() throws {
        var list = LargeModel.getDummy(count: 1_000_000)
        let item = LargeModel.getSample()
        
        self.measure {
            var inserted = list
            inserted.insert(item, at: 0)
            list = inserted
        }
    }
    
    // 0.003
    func testCircularQueueSmall() throws {
        let item = SmallModel.getSample()
        var list = [SmallModel]()
        
        self.measure {
            let queue = FixedCapacityCircularQueue<SmallModel>(minimumCapacity: 10_001)
            (0..<10_000).forEach { _ in
                queue.enqueue(item)
            }
            list = queue.toArray()
        }
    }
    
    // 0.005
    func testCircularQueueMedium() throws {
        let item = MediumModel.getSample()
        var list = [MediumModel]()
        
        self.measure {
            let queue = FixedCapacityCircularQueue<MediumModel>(minimumCapacity: 10_001)
            (0..<10_000).forEach { _ in
                queue.enqueue(item)
            }
            list = queue.toArray()
        }
    }
    
    // 0.006
    func testCircularQueueLarge() throws {
        let item = LargeModel.getSample()
        var list = [LargeModel]()
        
        self.measure {
            let queue = FixedCapacityCircularQueue<LargeModel>(minimumCapacity: 10_001)
            (0..<10_000).forEach { _ in
                queue.enqueue(item)
            }
            list = queue.toArray()
        }
    }
    
    // 0.000
    func testCircularQueueSmallOnce() throws {
        var queue = FixedCapacityCircularQueue<SmallModel>(minimumCapacity: 1_000_011)
        let item = SmallModel.getSample()
        (0..<1_000_000).forEach { _ in
            queue.enqueue(item)
        }
        
        self.measure {
            queue.enqueue(item)
        }
    }
    
    // 0.000
    func testCircularQueueMediumOnce() throws {
        var queue = FixedCapacityCircularQueue<MediumModel>(minimumCapacity: 1_000_011)
        let item = MediumModel.getSample()
        (0..<1_000_000).forEach { _ in
            queue.enqueue(item)
        }
        
        self.measure {
            queue.enqueue(item)
        }
    }
    
    // 0.000
    func testCircularQueueLargeOnce() throws {
        var queue = FixedCapacityCircularQueue<LargeModel>(minimumCapacity: 1_000_011)
        let item = LargeModel.getSample()
        (0..<1_000_000).forEach { _ in
            queue.enqueue(item)
        }
        
        self.measure {
            queue.enqueue(item)
        }
    }
}

@inline(__always)
private func nextPowerOfTwo(_ x: Int) -> Int {
    var v = max(1, x - 1)
    v |= v >> 1
    v |= v >> 2
    v |= v >> 4
    v |= v >> 8
    v |= v >> 16
#if arch(x86_64) || arch(arm64)
    v |= v >> 32
#endif
    return v + 1
}

@usableFromInline
final class FixedCapacityCircularQueue<Element> {
    @usableFromInline let buffer: UnsafeMutablePointer<Element>
    @usableFromInline let capacity: Int
    @usableFromInline let mask: Int
    @usableFromInline var head: Int = 0
    @usableFromInline var tail: Int = 0
    // invariants: count = tail - head (mod capacity), empty when head == tail
    // One-slot-empty ring to distinguish full/empty
    @inlinable var count: Int { (tail - head) & mask }
    @inlinable var isEmpty: Bool { head == tail }
    @inlinable var isFull: Bool { ((tail + 1) & mask) == head }

    /// capacity는 내부적으로 2의 거듭제곱으로 올림 + 1 슬롯을 구분용으로 비움
    init(minimumCapacity: Int) {
        precondition(minimumCapacity > 0)
        // 실제 버퍼 용량은 nextPow2(minimumCapacity + 1)  (한 칸 비우는 설계)
        let rawCap = nextPowerOfTwo(minimumCapacity + 1)
        self.capacity = rawCap
        self.mask = rawCap - 1
        self.buffer = UnsafeMutablePointer<Element>.allocate(capacity: rawCap)
    }

    deinit {
        // 남아있는 요소만 파괴
        var i = head
        while i != tail {
            (buffer + i).deinitialize(count: 1)
            i = (i &+ 1) & mask
        }
        buffer.deallocate()
    }

    /// 매우 빠른 enqueue: 가득 차면 실패 대신 precondition (개발 중 버그 빨리 잡기)
    @inlinable
    @inline(__always)
    func enqueue(_ element: Element) {
        precondition(!isFull, "FixedCapacityCircularQueue is full")
        (buffer + tail).initialize(to: element)
        tail = (tail &+ 1) & mask
    }

    /// 가득 차면 false 반환이 필요한 경우
    @inlinable
    @inline(__always)
    func tryEnqueue(_ element: Element) -> Bool {
        if isFull { return false }
        (buffer + tail).initialize(to: element)
        tail = (tail &+ 1) & mask
        return true
    }

    /// 비었으면 nil
    @inlinable
    @inline(__always)
    func dequeue() -> Element? {
        if isEmpty { return nil }
        let ptr = buffer + head
        let value = ptr.move()            // move: deinitialize + return
        head = (head &+ 1) & mask
        return value
    }

    /// front 요소를 소비 없이 읽음(비었으면 nil)
    @inlinable
    @inline(__always)
    func peek() -> Element? {
        if isEmpty { return nil }
        return (buffer + head).pointee
    }

    /// 전체 비우기(O(n))
    @inlinable
    func removeAll(keepingCapacity: Bool = true) {
        var i = head
        while i != tail {
            (buffer + i).deinitialize(count: 1)
            i = (i &+ 1) & mask
        }
        head = 0
        tail = 0
        // keepingCapacity만 지원(고정용량)
    }
}

extension FixedCapacityCircularQueue {
    /// 큐의 현재 요소들을 순서대로 [Element] 배열로 반환
    @inlinable
    func toArray() -> [Element] {
        var result = [Element]()
        result.reserveCapacity(count)
        
        if head <= tail {
            // 메모리 연속
            var i = head
            while i != tail {
                result.append((buffer + i).pointee)
                i &+= 1
            }
        } else {
            // 끊겨 있는 경우: head..capacity-1
            var i = head
            while i < capacity {
                result.append((buffer + i).pointee)
                i &+= 1
            }
            // 0..tail-1
            i = 0
            while i != tail {
                result.append((buffer + i).pointee)
                i &+= 1
            }
        }
        return result
    }
}
