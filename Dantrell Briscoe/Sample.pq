let
    Source = Csv.Document(File.Contents("C:\Users\dtrel\Downloads\International migration database Women.csv"),[Delimiter=",", Columns=13, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"CO2", type text}, {"Country of birth/nationality", type text}, {"VAR", type text}, {"Variable", type text}, {"GEN", type text}, {"Gender", type text}, {"COU", type text}, {"Country", type text}, {"YEA", Int64.Type}, {"Year", Int64.Type}, {"Value", Int64.Type}, {"Flag Codes", type text}, {"Flags", type text}}),
    #"Renamed Columns" = Table.RenameColumns(#"Changed Type",{{"Value", "MIGRATION TOTAL"}, {"Variable", "TYPE OF POPULATION FLUCATIONS"}}),
    #"Filtered Rows" = Table.SelectRows(#"Renamed Columns", each true),
    #"Removed Columns" = Table.RemoveColumns(#"Filtered Rows",{"GEN", "VAR", "CO2", "COU", "Year", "Flag Codes", "Flags"}),
    #"Added Custom" = Table.AddColumn(#"Removed Columns", "Attribute", each [TYPE OF POPULATION FLUCATIONS]& " - " & [Gender]),
    #"Removed Columns1" = Table.RemoveColumns(#"Added Custom",{"TYPE OF POPULATION FLUCATIONS", "Gender"}),
    #"Pivoted Column" = Table.Pivot(#"Removed Columns1", List.Distinct(#"Removed Columns1"[Attribute]), "Attribute", "MIGRATION TOTAL", List.Sum),
    #"Grouped Rows" = Table.Group(#"Pivoted Column", {"Country of birth/nationality", "Country", "YEA"}, 
    {
        {"Inflows of foreign population by nationality - Women", each List.Sum([#"Inflows of foreign population by nationality - Women"]), type nullable number}, 
        {"Outflows of foreign population by nationality - Women", each List.Sum([#"Outflows of foreign population by nationality - Women"]), type nullable number}, 
        {"Stock of foreign-born population by country of birth - Women", each List.Sum([#"Stock of foreign-born population by country of birth - Women"]), type nullable number}, 
        {"Inflows of foreign population by nationality - Total", each List.Sum([#"Inflows of foreign population by nationality - Total"]), type nullable number}, 
        {"Outflows of foreign population by nationality - Total", each List.Sum([#"Outflows of foreign population by nationality - Total"]), type nullable number}, 
        {"Stock of foreign-born population by country of birth - Total", each List.Sum([#"Stock of foreign-born population by country of birth - Total"]), type nullable number}, 
        {"Stock of foreign population by nationality - Total", each List.Sum([#"Stock of foreign population by nationality - Total"]), type nullable number}, 
        {"Stock of foreign population by nationality - Women", each List.Sum([#"Stock of foreign population by nationality - Women"]), type nullable number},
        {"Acquisition of Nationality by country of former nationality - Women", each List.Sum([#"Acquisition of Nationality by country of former nationality - Women"]), type nullable number},
        {"Acquisition of Nationality by country of former nationality - Total", each List.Sum([#"Acquisition of Nationality by country of former nationality - Total"]), type nullable number}})
in
    #"Grouped Rows"