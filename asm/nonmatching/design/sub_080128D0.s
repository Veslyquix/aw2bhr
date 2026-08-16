	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080128D0
sub_080128D0: @ 0x080128D0
	push {lr}
	bl sub_08012420
	bl sub_0801258C
	ldr r1, _08012930 @ =0x04000040
	ldr r0, _08012934 @ =gUnknown_03002B4C
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #1
	ldr r0, _08012938 @ =gUnknown_03002B40
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #3
	ldr r0, _0801293C @ =gUnknown_03002B44
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #1
	ldr r0, _08012940 @ =gUnknown_03002EFC
	ldrb r0, [r0]
	strb r0, [r1]
	subs r1, #3
	ldr r0, _08012944 @ =gUnknown_030024E4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #1
	ldr r0, _08012948 @ =gUnknown_03002B68
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #3
	ldr r0, _0801294C @ =gUnknown_030020B8
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #1
	ldr r0, _08012950 @ =gUnknown_03002B30
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #1
	ldr r0, _08012954 @ =gUnknown_030030A4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08012958 @ =gUnknown_030030DC
	ldrh r0, [r0]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08012930: .4byte 0x04000040
_08012934: .4byte gUnknown_03002B4C
_08012938: .4byte gUnknown_03002B40
_0801293C: .4byte gUnknown_03002B44
_08012940: .4byte gUnknown_03002EFC
_08012944: .4byte gUnknown_030024E4
_08012948: .4byte gUnknown_03002B68
_0801294C: .4byte gUnknown_030020B8
_08012950: .4byte gUnknown_03002B30
_08012954: .4byte gUnknown_030030A4
_08012958: .4byte gUnknown_030030DC

