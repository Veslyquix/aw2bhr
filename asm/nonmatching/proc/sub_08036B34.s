	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08036B34
sub_08036B34: @ 0x08036B34
	push {lr}
	ldr r1, _08036B44 @ =gUnknown_030043F4
	movs r0, #0
	strh r0, [r1]
	bl sub_0801F00C
	pop {r0}
	bx r0
	.align 2, 0
_08036B44: .4byte gUnknown_030043F4
_08036B48:
	b _08036B48
	.align 2, 0

	thumb_func_start sub_08036B4C
sub_08036B4C: @ 0x08036B4C
	push {r4, lr}
	ldr r0, _08036BE8 @ =gUnknown_030040A0
	movs r4, #0
	str r4, [r0]
	ldr r0, _08036BEC @ =gUnknown_02028E40
	strb r4, [r0]
	bl sub_08010FE0
	movs r0, #0
	bl sub_080366C4
	movs r0, #0
	bl sub_080366D0
	ldr r0, _08036BF0 @ =gUnknown_03004094
	strb r4, [r0]
	ldr r0, _08036BF4 @ =gUnknown_03004008
	str r4, [r0]
	ldr r0, _08036BF8 @ =gUnknown_03003330
	str r4, [r0]
	ldr r0, _08036BFC @ =gUnknown_03004078
	str r4, [r0]
	ldr r0, _08036C00 @ =gUnknown_030043F0
	str r4, [r0]
	ldr r0, _08036C04 @ =gUnknown_030033F0
	strh r4, [r0]
	bl sub_08036B34
	bl sub_0801B6BC
	bl sub_0803486C
	bl sub_08034848
	bl sub_0801BCE0
	bl sub_08015544
	bl sub_08011C18
	bl sub_08011B18
	bl sub_08011A84
	bl sub_080191B0
	bl sub_08015184
	bl Proc_Init
	bl sub_08035568
	bl sub_08010F94
	bl sub_08013434
	bl sub_0801F4A4
	bl sub_0801295C
	bl sub_080128D0
	bl sub_0803B37C
	bl sub_0803B688
	bl sub_08030ED4
	bl sub_08085AF4
	movs r0, #0
	bl sub_08080F90
	bl sub_0801F114
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08036BE8: .4byte gUnknown_030040A0
_08036BEC: .4byte gUnknown_02028E40
_08036BF0: .4byte gUnknown_03004094
_08036BF4: .4byte gUnknown_03004008
_08036BF8: .4byte gUnknown_03003330
_08036BFC: .4byte gUnknown_03004078
_08036C00: .4byte gUnknown_030043F0
_08036C04: .4byte gUnknown_030033F0

	thumb_func_start sub_08036C08
sub_08036C08: @ 0x08036C08
	push {lr}
	bl sub_0801F018
	ldr r0, _08036C24 @ =sub_08036A50
	bl sub_080366D0
	ldr r0, _08036C28 @ =sub_08036AB8
	bl sub_080366C4
	bl sub_08036B28
	pop {r0}
	bx r0
	.align 2, 0
_08036C24: .4byte sub_08036A50
_08036C28: .4byte sub_08036AB8

	thumb_func_start sub_08036C2C
sub_08036C2C: @ 0x08036C2C
	push {lr}
	bl sub_08036B4C
	bl sub_08036C08
	ldr r0, _08036C48 @ =gUnknown_08553754
	movs r1, #3
	bl Proc_Start
	bl sub_08036B34
	pop {r0}
	bx r0
	.align 2, 0
_08036C48: .4byte gUnknown_08553754

	thumb_func_start sub_08036C4C
sub_08036C4C: @ 0x08036C4C
	push {lr}
	bl sub_0801F00C
	bl sub_08036B4C
	ldr r1, _08036C70 @ =gUnknown_030032CC
	ldr r0, _08036C74 @ =0x00000E28
	str r0, [r1]
	ldr r0, _08036C78 @ =sub_08036884
	bl sub_080366D0
	ldr r0, _08036C7C @ =sub_080368E8
	bl sub_080366C4
	bl sub_0806A454
	pop {r0}
	bx r0
	.align 2, 0
_08036C70: .4byte gUnknown_030032CC
_08036C74: .4byte 0x00000E28
_08036C78: .4byte sub_08036884
_08036C7C: .4byte sub_080368E8

	thumb_func_start sub_08036C80
sub_08036C80: @ 0x08036C80
	push {lr}
	bl sub_0801F00C
	bl sub_08036B4C
	ldr r1, _08036CA4 @ =gUnknown_030032CC
	ldr r0, _08036CA8 @ =0x00000E28
	str r0, [r1]
	ldr r0, _08036CAC @ =sub_08036884
	bl sub_080366D0
	ldr r0, _08036CB0 @ =sub_080368E8
	bl sub_080366C4
	bl sub_0806A454
	pop {r0}
	bx r0
	.align 2, 0
_08036CA4: .4byte gUnknown_030032CC
_08036CA8: .4byte 0x00000E28
_08036CAC: .4byte sub_08036884
_08036CB0: .4byte sub_080368E8

	thumb_func_start sub_08036CB4
sub_08036CB4: @ 0x08036CB4
	push {r4, r5, r6, lr}
	sub sp, #8
	mov r1, sp
	ldr r2, _08036D10 @ =gUnknown_02028E41
	ldrb r0, [r2]
	movs r3, #0
	strb r0, [r1]
	ldrb r0, [r2, #1]
	mov r6, sp
	adds r6, #1
	strb r0, [r6]
	ldrb r0, [r2, #2]
	mov r5, sp
	adds r5, #2
	strb r0, [r5]
	ldrb r0, [r2, #3]
	mov r4, sp
	adds r4, #3
	strb r0, [r4]
	add r0, sp, #4
	strh r3, [r0]
	ldr r1, _08036D14 @ =0x040000D4
	str r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #0x12
	str r0, [r1, #4]
	ldr r0, _08036D18 @ =0x81020000
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r6]
	strb r0, [r2, #1]
	ldrb r0, [r5]
	strb r0, [r2, #2]
	ldrb r0, [r4]
	strb r0, [r2, #3]
	movs r0, #0xfe
	bl SoftReset
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08036D10: .4byte gUnknown_02028E41
_08036D14: .4byte 0x040000D4
_08036D18: .4byte 0x81020000

	thumb_func_start AgbMain
AgbMain: @ 0x08036D1C
	push {r4, lr}
	sub sp, #0xc
	movs r0, #0
	str r0, [sp, #8]
	ldr r1, _08036DBC @ =0x040000D4
	add r0, sp, #8
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	str r0, [r1, #4]
	ldr r0, _08036DC0 @ =0x85001FE0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _08036DC4 @ =0x04000204
	ldr r2, _08036DC8 @ =0x000045B4
	adds r0, r2, #0
	strh r0, [r1]
	add r2, sp, #4
	ldr r0, _08036DCC @ =0x04000130
	ldrh r1, [r0]
	ldr r3, _08036DD0 @ =0x000003FF
	adds r0, r3, #0
	bics r0, r1
	strh r0, [r2]
	bl sub_0801BABC
	ldr r0, _08036DD4 @ =gUnknown_02003000
	movs r1, #0x80
	lsls r1, r1, #8
	bl sub_08014DA8
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08036D66
	bl _08036B48
_08036D66:
	ldr r0, _08036DD8 @ =sub_08016B2C
	ldr r1, _08036DDC @ =sub_08016A54
	ldr r2, _08036DE0 @ =gUnknown_02000000
	ldr r3, _08036DE4 @ =gUnknown_03003064
	str r3, [sp]
	movs r3, #2
	bl sub_0801A79C
	bl sub_08016E3C
	bl sub_0803D48C
	ldr r0, _08036DE8 @ =0x0A6B99CD
	bl sub_080129D4
	bl sub_080128C4
	bl sub_080128D0
	ldr r1, _08036DEC @ =sub_080366F4
	movs r0, #0
	bl sub_0801BB00
	movs r2, #0
	add r0, sp, #4
	ldrh r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xf
	beq _08036DB0
	add r0, sp, #4
	ldrh r1, [r0]
	movs r0, #0x85
	lsls r0, r0, #2
	cmp r1, r0
	bne _08036DB0
	movs r2, #1
_08036DB0:
	cmp r2, #0
	beq _08036DF0
	bl sub_08036E54
	b _08036DF4
	.align 2, 0
_08036DBC: .4byte 0x040000D4
_08036DC0: .4byte 0x85001FE0
_08036DC4: .4byte 0x04000204
_08036DC8: .4byte 0x000045B4
_08036DCC: .4byte 0x04000130
_08036DD0: .4byte 0x000003FF
_08036DD4: .4byte gUnknown_02003000
_08036DD8: .4byte sub_08016B2C
_08036DDC: .4byte sub_08016A54
_08036DE0: .4byte gUnknown_02000000
_08036DE4: .4byte gUnknown_03003064
_08036DE8: .4byte 0x0A6B99CD
_08036DEC: .4byte sub_080366F4
_08036DF0:
	bl sub_08036C4C
_08036DF4:
	ldr r1, _08036E10 @ =0x00012001
	movs r0, #2
	bl sub_0801BB10
	ldr r4, _08036E14 @ =gUnknown_030040EC
_08036DFE:
	ldr r0, [r4]
	cmp r0, #0
	beq _08036E08
	bl _call_via_r0
_08036E08:
	bl sub_08036E18
	b _08036DFE
	.align 2, 0
_08036E10: .4byte 0x00012001
_08036E14: .4byte gUnknown_030040EC

