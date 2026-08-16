	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804F0D8
sub_0804F0D8: @ 0x0804F0D8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	ldr r3, _0804F170 @ =gUnknown_03001470
	ldr r0, _0804F174 @ =gUnknown_03001FBC
	mov sb, r0
	movs r1, #0
	ldrsh r2, [r0, r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #5
	adds r0, r3, #0
	adds r0, #0x30
	adds r0, r1, r0
	ldrh r5, [r0]
	adds r3, #0x34
	adds r1, r1, r3
	ldrh r4, [r1]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0804BECC
	lsls r0, r0, #0x10
	lsls r2, r5, #2
	ldr r1, _0804F178 @ =gUnknown_084C3F78
	adds r1, r2, r1
	ldr r1, [r1]
	mov r8, r1
	ldr r6, _0804F17C @ =gUnknown_02029A10
	lsls r3, r4, #3
	adds r3, r3, r4
	lsls r3, r3, #2
	movs r1, #0xb4
	muls r1, r5, r1
	adds r3, r3, r1
	adds r3, r3, r6
	ldr r4, _0804F180 @ =gUnknown_08553B28
	lsrs r0, r0, #0xf
	lsls r1, r5, #1
	adds r1, r1, r5
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r0, r4
	ldrh r0, [r0]
	ldrh r4, [r3, #8]
	adds r0, r0, r4
	strh r0, [r3, #8]
	ldr r1, _0804F184 @ =gUnknown_085644D4
	ldr r0, _0804F188 @ =gUnknown_02028E5C
	adds r2, r2, r0
	ldrh r0, [r2, #2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r3, #0xa]
	ldrh r0, [r0]
	subs r2, r2, r0
	strh r2, [r3, #0xa]
	mov r1, sb
	movs r4, #0
	ldrsh r0, [r1, r4]
	movs r4, #8
	ldrsh r1, [r3, r4]
	mov r4, r8
	ldrh r3, [r4]
	subs r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_080155C0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F170: .4byte gUnknown_03001470
_0804F174: .4byte gUnknown_03001FBC
_0804F178: .4byte gUnknown_084C3F78
_0804F17C: .4byte gUnknown_02029A10
_0804F180: .4byte gUnknown_08553B28
_0804F184: .4byte gUnknown_085644D4
_0804F188: .4byte gUnknown_02028E5C

