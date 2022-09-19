struct MatchDetailsHeaderModel {
    let leftTeam, rightTeam: Team
    let matchTime: String
    
    struct Team {
        let imageUrl, name: String
    }
}
