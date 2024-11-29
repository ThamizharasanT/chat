   func initiateChat() {
        let chatDetailData: [String: Any] = [
            "datetime": Timestamp(date: Date()), // Use the current date
            "is_chat_end": false,
            "participants": self.chatTokens,
            "student_name": "",
            "teacher_name": chatPerson?.TeacherName ?? ""
        ]
        
        // Add a new chat document to the 'chat' collection
        db.collection("chat").addDocument(data: chatDetailData) { error in
            if let error = error {
                // Handle error
                print("Error adding document: \(error.localizedDescription)")
            } else {
                // Get the DocumentReference for the newly created document
                let documentID = self.db.collection("chat").document().documentID
                // Save the document ID to UserDefaults
                UserDefaults.standard.set(documentID.first, forKey: "documentID")
              
            }
        }
    }
