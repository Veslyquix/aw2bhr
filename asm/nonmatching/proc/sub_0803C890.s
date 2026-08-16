	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C890
sub_0803C890: @ 0x0803C890
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	ldr r2, _0803C8E8 @ =gUnknown_0849EDB0
	ldr r1, [r2, #4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0803C8E2
	adds r5, r2, #0
	adds r6, r5, #4
	adds r7, r5, #0
	adds r7, #0x10
_0803C8A8:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r2, r0, #3
	adds r0, r2, r6
	ldr r1, [r0]
	ldr r0, _0803C8EC @ =0x0000FFFE
	cmp r1, r0
	bhi _0803C8CA
	adds r1, r5, #0
	adds r1, #0xc
	adds r1, r2, r1
	adds r0, r2, r7
	ldr r0, [r0]
	ldr r2, [r1]
	movs r1, #1
	bl _call_via_r2
_0803C8CA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0803C8A8
_0803C8E2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C8E8: .4byte gUnknown_0849EDB0
_0803C8EC: .4byte 0x0000FFFE

