	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074320
sub_08074320: @ 0x08074320
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08074584
	adds r2, r0, #0
	ldr r0, _08074374 @ =gUnknown_08499594
	ldr r1, [r0]
	subs r1, r4, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #2
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0807437C
	cmp r2, #0
	beq _0807437C
	ldr r0, [r2, #8]
	cmp r0, #0
	beq _0807437C
	adds r1, r4, #0
	movs r2, #0
	bl sub_08074484
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0807436E
	ldr r0, _08074378 @ =gUnknown_08614268
	movs r1, #3
	bl Proc_Start
_0807436E:
	adds r0, r4, #0
	b _0807437E
	.align 2, 0
_08074374: .4byte gUnknown_08499594
_08074378: .4byte gUnknown_08614268
_0807437C:
	movs r0, #0
_0807437E:
	pop {r4}
	pop {r1}
	bx r1

