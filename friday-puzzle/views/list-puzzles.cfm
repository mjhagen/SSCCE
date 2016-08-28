<cfoutput>
  <ul>
    <cfloop array="#local.puzzles#" index="puzzle">
      <li><a href="./puzzles/#puzzle#">#puzzle#</a></li>
    </cfloop>
  </ul>
</cfoutput>