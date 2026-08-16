	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F400
sub_0801F400: @ 0x0801F400
	adds r1, r0, #0
	cmp r1, #5
	bhi _0801F442
	lsls r0, r1, #2
	ldr r1, _0801F410 @ =_0801F414
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801F410: .4byte _0801F414
_0801F414: @ jump table
	.4byte _0801F42C @ case 0
	.4byte _0801F430 @ case 1
	.4byte _0801F434 @ case 2
	.4byte _0801F438 @ case 3
	.4byte _0801F43C @ case 4
	.4byte _0801F440 @ case 5
_0801F42C:
	movs r0, #0
	b _0801F442
_0801F430:
	movs r0, #0x3e
	b _0801F442
_0801F434:
	movs r0, #0x43
	b _0801F442
_0801F438:
	movs r0, #0xac
	b _0801F442
_0801F43C:
	movs r0, #0xb8
	b _0801F442
_0801F440:
	movs r0, #0xbc
_0801F442:
	bx lr

