	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801348C
sub_0801348C: @ 0x0801348C
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0x30
	bne _080134A6
	movs r0, #0x30
	eors r1, r0
	lsls r0, r1, #0x10
	lsrs r3, r0, #0x10
_080134A6:
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0xc0
	bne _080134BC
	adds r0, r1, #0
	movs r1, #0xc0
	eors r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_080134BC:
	ldrh r1, [r2, #8]
	strh r1, [r2, #0xe]
	strh r3, [r2, #8]
	adds r0, r3, #0
	bics r0, r1
	strh r0, [r2, #0xa]
	strh r0, [r2, #0xc]
	adds r4, r3, #0
	cmp r4, #0
	beq _080134F0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r4, r0
	bne _080134F0
	ldrh r0, [r2, #0x10]
	subs r0, #1
	strh r0, [r2, #0x10]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080134F6
	strh r3, [r2, #0xa]
	ldr r0, _080134EC @ =gUnknown_03002F94
	b _080134F2
	.align 2, 0
_080134EC: .4byte gUnknown_03002F94
_080134F0:
	ldr r0, _0801350C @ =gUnknown_030030C8
_080134F2:
	ldr r0, [r0]
	strh r0, [r2, #0x10]
_080134F6:
	ldrh r0, [r2, #8]
	strh r0, [r2]
	ldrh r0, [r2, #0xc]
	strh r0, [r2, #4]
	ldrh r0, [r2, #0xa]
	strh r0, [r2, #2]
	ldrh r0, [r2, #0xe]
	strh r0, [r2, #6]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801350C: .4byte gUnknown_030030C8

