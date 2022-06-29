//
//  SystemInfo.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 23/06/2022.
//

import Foundation
import VerIDCore

extension SystemInfo {
    
    convenience init(_ systemInfo: Verid_SystemInfo) {
        self.init(deviceInfo: DeviceInfo(systemInfo.deviceInfo), veridVersion: systemInfo.veridVersion, veridSettings: DetRecLibSettings(systemInfo.veridSettings), faceDetectionClassName: systemInfo.faceDetectionClassName, faceRecognitionClassName: systemInfo.faceRecognitionClassName, userManagementClassName: systemInfo.userManagementClassName, defaultFaceTemplateVersion: "unknown")
    }
}

extension DeviceInfo {
    
    convenience init(_ deviceInfo: Verid_DeviceInfo) {
        self.init(make: deviceInfo.make, model: deviceInfo.model, os: deviceInfo.os, osVersion: deviceInfo.osVersion)
    }
}

extension DetRecLibSettings {
    
    convenience init(_ verIDSettings: Verid_VeridSettings) {
        self.init()
        self.confidenceThreshold = verIDSettings.confidenceThreshold
        self.sizeRange = verIDSettings.sizeRange
        self.rollRangeLarge = verIDSettings.rollRangeLarge
        self.rollRangeSmall = verIDSettings.rollRangeSmall
        self.yawRangeLarge = verIDSettings.yawRangeLarge
        self.yawRangeSmall = verIDSettings.yawRangeSmall
        self.landmarkOptions = verIDSettings.landmarkOptions
        self.matrixTemplateVersion = verIDSettings.matrixTemplateVersion
        self.yawPitchVariant = verIDSettings.yawPitchVariant
        self.eyeDetectionVariant = verIDSettings.eyeDetectionVariant
        self.defaultTemplateVersion = verIDSettings.defaultTemplateVersion
        self.reduceConfidenceCalculation = verIDSettings.reduceConfidenceCalculation
        self.lightingMatrix = verIDSettings.lightingMatrix
        self.lightingCompensation = verIDSettings.lightingCompensation
        self.poseVariant = verIDSettings.poseVariant
        self.poseCompensation = verIDSettings.poseCompensation
        self.detectSmile = verIDSettings.detectSmile
        self.qualityThreshold = verIDSettings.qualityThreshold
        self.attemptMultiThreading = verIDSettings.attemptMultiThreading
        self.faceExtractQualityThreshold = verIDSettings.faceExtractQualityThreshold
        self.landmarkTrackingQualityThreshold = verIDSettings.landmarkTrackingQualityThreshold
    }
}

extension Verid_SystemInfo {
    
    init(_ systemInfo: SystemInfo) {
        self.deviceInfo = Verid_DeviceInfo(systemInfo.deviceInfo)
        self.veridVersion = systemInfo.veridVersion
        self.veridSettings = Verid_VeridSettings(systemInfo.veridSettings)
        self.faceDetectionClassName = systemInfo.faceDetectionClassName
        self.faceRecognitionClassName = systemInfo.faceRecognitionClassName
        self.userManagementClassName = systemInfo.userManagementClassName
    }
}

extension Verid_DeviceInfo {
    
    init(_ deviceInfo: DeviceInfo) {
        self.make = deviceInfo.make
        self.model = deviceInfo.model
        self.os = deviceInfo.os
        self.osVersion = deviceInfo.osVersion
    }
}

extension Verid_VeridSettings {
    
    init(_ verIDSettings: DetRecLibSettings) {
        self.confidenceThreshold = verIDSettings.confidenceThreshold
        self.sizeRange = verIDSettings.sizeRange
        self.rollRangeLarge = verIDSettings.rollRangeLarge
        self.rollRangeSmall = verIDSettings.rollRangeSmall
        self.yawRangeLarge = verIDSettings.yawRangeLarge
        self.yawRangeSmall = verIDSettings.yawRangeSmall
        self.landmarkOptions = verIDSettings.landmarkOptions
        self.matrixTemplateVersion = verIDSettings.matrixTemplateVersion
        self.yawPitchVariant = verIDSettings.yawPitchVariant
        self.eyeDetectionVariant = verIDSettings.eyeDetectionVariant
        self.defaultTemplateVersion = verIDSettings.defaultTemplateVersion
        self.reduceConfidenceCalculation = verIDSettings.reduceConfidenceCalculation
        self.lightingMatrix = verIDSettings.lightingMatrix
        self.lightingCompensation = verIDSettings.lightingCompensation
        self.poseVariant = verIDSettings.poseVariant
        self.poseCompensation = verIDSettings.poseCompensation
        self.detectSmile = verIDSettings.detectSmile
        self.qualityThreshold = verIDSettings.qualityThreshold
        self.attemptMultiThreading = verIDSettings.attemptMultiThreading
        self.faceExtractQualityThreshold = verIDSettings.faceExtractQualityThreshold
        self.landmarkTrackingQualityThreshold = verIDSettings.landmarkTrackingQualityThreshold
    }
}
