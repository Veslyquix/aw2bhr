	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805FD64
sub_0805FD64: @ 0x0805FD64
	push {lr}
	ldr r1, _0805FD84 @ =gUnknown_03004774
	movs r0, #0
	str r0, [r1]
	ldr r0, _0805FD88 @ =gUnknown_030045D4
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	bhi _0805FE06
	lsls r0, r0, #2
	ldr r1, _0805FD8C @ =_0805FD90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805FD84: .4byte gUnknown_03004774
_0805FD88: .4byte gUnknown_030045D4
_0805FD8C: .4byte _0805FD90
_0805FD90: @ jump table
	.4byte _0805FDC0 @ case 0
	.4byte _0805FDC6 @ case 1
	.4byte _0805FDCC @ case 2
	.4byte _0805FDD2 @ case 3
	.4byte _0805FDD8 @ case 4
	.4byte _0805FDDE @ case 5
	.4byte _0805FDE4 @ case 6
	.4byte _0805FDEA @ case 7
	.4byte _0805FDF0 @ case 8
	.4byte _0805FDF6 @ case 9
	.4byte _0805FDFC @ case 10
	.4byte _0805FE02 @ case 11
_0805FDC0:
	bl sub_0805FE0C
	b _0805FE06
_0805FDC6:
	bl sub_0805FF64
	b _0805FE06
_0805FDCC:
	bl sub_0805FFA0
	b _0805FE06
_0805FDD2:
	bl sub_08060424
	b _0805FE06
_0805FDD8:
	bl sub_0806044C
	b _0805FE06
_0805FDDE:
	bl sub_08060474
	b _0805FE06
_0805FDE4:
	bl sub_080604A4
	b _0805FE06
_0805FDEA:
	bl sub_08060324
	b _0805FE06
_0805FDF0:
	bl sub_08060384
	b _0805FE06
_0805FDF6:
	bl sub_080603D4
	b _0805FE06
_0805FDFC:
	bl sub_0806050C
	b _0805FE06
_0805FE02:
	bl sub_08060554
_0805FE06:
	pop {r0}
	bx r0
	.align 2, 0

