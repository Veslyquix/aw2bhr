	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801820C
sub_0801820C: @ 0x0801820C
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0xe]
	subs r0, #4
	movs r1, #0
	strh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08018222
	str r1, [r2, #8]
	strh r1, [r2, #0xe]
_08018222:
	ldr r1, _08018244 @ =gUnknown_0300309C
	ldrh r2, [r2, #0xe]
	movs r3, #0x70
	rsbs r3, r3, #0
	adds r0, r3, #0
	subs r0, r0, r2
	strh r0, [r1]
	ldr r1, _08018248 @ =gUnknown_03002028
	strh r0, [r1]
	ldr r0, _0801824C @ =gUnknown_03001420
	strh r2, [r0]
	ldr r0, _08018250 @ =sub_08017EEC
	bl sub_08011AAC
	pop {r0}
	bx r0
	.align 2, 0
_08018244: .4byte gUnknown_0300309C
_08018248: .4byte gUnknown_03002028
_0801824C: .4byte gUnknown_03001420
_08018250: .4byte sub_08017EEC

