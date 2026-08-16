	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803C814
sub_0803C814: @ 0x0803C814
	push {r4, r5, r6, lr}
	ldr r2, _0803C84C @ =gUnknown_0849EDB0
	ldr r1, [r2, #4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0803C85A
	adds r5, r2, #0
	adds r6, r5, #4
	movs r4, #0
_0803C828:
	adds r1, r5, #0
	adds r1, #8
	adds r1, r4, r1
	adds r0, r5, #0
	adds r0, #0x10
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, [r1]
	bl _call_via_r1
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0803C850
	movs r0, #1
	b _0803C85C
	.align 2, 0
_0803C84C: .4byte gUnknown_0849EDB0
_0803C850:
	adds r6, #0x18
	adds r4, #0x18
	ldr r0, [r6]
	cmp r0, r1
	bne _0803C828
_0803C85A:
	movs r0, #0
_0803C85C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

