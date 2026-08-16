	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08033194
sub_08033194: @ 0x08033194
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _0803320C @ =gUnknown_030032DC
	ldr r0, _08033210 @ =gUnknown_08090D5C
	ldr r1, [r0]
	str r1, [r2]
	ldr r2, _08033214 @ =gUnknown_03003F28
	ldr r0, [r0, #4]
	subs r0, r0, r1
	str r0, [r2]
	ldr r2, _08033218 @ =gUnknown_03003F44
	movs r3, #0xac
	lsls r3, r3, #2
	adds r0, r1, r3
	str r0, [r2]
	ldr r0, _0803321C @ =gUnknown_03003F70
	str r1, [r0, #0x28]
	adds r1, r0, #0
	adds r1, #0x4b
	movs r5, #0
	strb r5, [r1]
	bl sub_08062FB8
	ldr r1, _08033220 @ =gUnknown_0849B018
	ldr r2, [r1]
	ldrb r0, [r2, #0xa]
	movs r0, #4
	strb r0, [r2, #0xa]
	ldr r0, [r1]
	ldrb r2, [r0, #6]
	strb r5, [r0, #6]
	ldr r0, [r1]
	ldrb r1, [r0, #9]
	strb r5, [r0, #9]
	ldr r1, _08033224 @ =gUnknown_030030A4
	ldrb r0, [r1]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1]
	ldrb r0, [r1, #1]
	orrs r0, r2
	strb r0, [r1, #1]
	ldr r1, _08033228 @ =gUnknown_030030DC
	ldrb r0, [r1, #1]
	orrs r0, r2
	strb r0, [r1, #1]
	ldr r4, _0803322C @ =gUnknown_0849B060
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #0
	movs r2, #0
	bl sub_080315E8
	ldr r1, [r4]
	strh r0, [r1]
	adds r6, #0x64
	strh r5, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803320C: .4byte gUnknown_030032DC
_08033210: .4byte gUnknown_08090D5C
_08033214: .4byte gUnknown_03003F28
_08033218: .4byte gUnknown_03003F44
_0803321C: .4byte gUnknown_03003F70
_08033220: .4byte gUnknown_0849B018
_08033224: .4byte gUnknown_030030A4
_08033228: .4byte gUnknown_030030DC
_0803322C: .4byte gUnknown_0849B060

