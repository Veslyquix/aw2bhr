	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012BC8
sub_08012BC8: @ 0x08012BC8
	push {r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x14]
	ldr r5, [sp, #0x18]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	movs r3, #0
	lsrs r1, r1, #0xf
	adds r0, r0, r1
	lsrs r2, r2, #0xa
	adds r7, r0, r2
	movs r2, #0
	cmp r2, r4
	bhs _08012C16
_08012BEE:
	lsls r0, r3, #1
	adds r1, r7, r0
	movs r0, #0
	adds r3, #0x20
	adds r2, #1
	cmp r0, r6
	bhs _08012C0A
_08012BFC:
	strh r5, [r1]
	adds r1, #2
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r6
	blo _08012BFC
_08012C0A:
	lsls r0, r3, #0x10
	lsrs r3, r0, #0x10
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r4
	blo _08012BEE
_08012C16:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

