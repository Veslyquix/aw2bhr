	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072614
sub_08072614: @ 0x08072614
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x34]
	cmp r0, r1
	blo _08072678
	movs r0, #0
	strh r0, [r4, #0x36]
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x32]
	bl DivRem
	adds r5, r0, #0
	ldrh r0, [r4, #0x3a]
	cmp r0, #0
	beq _08072642
	mvns r0, r5
	ldrh r2, [r4, #0x32]
	adds r5, r0, r2
_08072642:
	lsls r6, r5, #1
	ldr r0, [r4, #0x2c]
	adds r0, r0, r6
	ldrh r1, [r4, #0x30]
	ldrh r2, [r4, #0x32]
	subs r2, r2, r5
	lsls r2, r2, #0x11
	lsrs r2, r2, #0x10
	bl ApplyPaletteExt
	cmp r5, #0
	ble _08072672
	ldr r0, [r4, #0x2c]
	ldrh r1, [r4, #0x32]
	lsls r1, r1, #1
	ldrh r2, [r4, #0x30]
	adds r1, r1, r2
	subs r1, r1, r6
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r5, #0x11
	lsrs r2, r2, #0x10
	bl ApplyPaletteExt
_08072672:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_08072678:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

