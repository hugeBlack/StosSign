//
//  AppleAPI+CertificateLegacy.swift
//  StosSign
//

import Foundation
import StosSign_Certificate
import StosSign_API_NoCertificate

@available(*, deprecated, message: "Please Use async functions instead")
extension AppleAPI {
    public func fetchCertificatesForTeam(team: Team, session: AppleAPISession, completion: @escaping ([Certificate]?, Error?) -> Void) {
        Task {
            do {
                let certificates = try await fetchCertificatesForTeam(team: team, session: session)
                completion(certificates, nil)
            } catch {
                completion(nil, error)
            }
        }
    }

    public func addCertificateWithMachineName(machineName: String, team: Team, session: AppleAPISession, completion: @escaping (Certificate?, Error?) -> Void) {
        Task {
            do {
                let certificate = try await addCertificateWithMachineName(machineName: machineName, team: team, session: session)
                completion(certificate, nil)
            } catch {
                completion(nil, error)
            }
        }
    }

    public func revokeCertificate(certificate: Certificate, team: Team, session: AppleAPISession, completion: @escaping (Bool, Error?) -> Void) {
        Task {
            do {
                let success = try await revokeCertificate(certificate: certificate, team: team, session: session)
                completion(success, nil)
            } catch {
                completion(false, error)
            }
        }
    }
}

