	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078498
sub_08078498: @ 0x08078498
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080784C4 @ =gUnknown_03002F08
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_08014BC0
	ldr r0, [r4, #0x58]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [r4, #0x5c]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, [r4, #0x60]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl sub_08019818
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080784C4: .4byte gUnknown_03002F08

