	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C670
sub_0803C670: @ 0x0803C670
	push {r4, r5, r6, lr}
	movs r4, #0
_0803C674:
	adds r0, r4, #0
	movs r1, #1
	bl sub_0803C950
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #8
	bls _0803C674
	movs r4, #0
_0803C688:
	adds r0, r4, #0
	movs r1, #1
	bl sub_0803C8F0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xbf
	bls _0803C688
	movs r4, #0
_0803C69C:
	adds r0, r4, #0
	movs r1, #1
	bl sub_0803C97C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x12
	bls _0803C69C
	movs r4, #0
_0803C6B0:
	adds r0, r4, #0
	movs r1, #1
	bl sub_0803C9A8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x12
	bls _0803C6B0
	movs r4, #0x60
_0803C6C4:
	adds r0, r4, #0
	movs r1, #0
	bl sub_0803CBA0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x9f
	bls _0803C6C4
	movs r4, #0x20
_0803C6D8:
	adds r0, r4, #0
	movs r1, #0
	bl sub_0803CBA0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x5f
	bls _0803C6D8
	movs r4, #0
_0803C6EC:
	adds r0, r4, #0
	movs r1, #0
	bl sub_0803CA28
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xbf
	bls _0803C6EC
	movs r4, #0
	ldr r2, _0803C74C @ =gUnknown_0849EDB0
	ldr r1, [r2, #4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0803C744
	adds r5, r2, #0
	adds r6, r5, #4
_0803C710:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r2, r5, #0
	adds r2, #0xc
	adds r2, r0, r2
	adds r1, r5, #0
	adds r1, #0x10
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #0
	bl _call_via_r2
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
	bne _0803C710
_0803C744:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803C74C: .4byte gUnknown_0849EDB0

